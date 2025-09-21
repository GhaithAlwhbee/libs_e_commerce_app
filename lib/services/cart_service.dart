import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:libs_e_commerce_app/services/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  late CollectionReference<Map<String, dynamic>> userCartCollection;
  CartProvider() {
    loadCartItems();
    userCartCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('cart');
  }
  List<CartModel> _carts = [];
  List<CartModel> get carts => _carts;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // final CollectionReference userCartCollection = FirebaseFirestore.instance
  //     .collection('userCart');

  // final CollectionReference<Map<String, dynamic>> userCartCollection =
  //     FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .collection('cart');

  Future<void> reset() async {
    _carts = [];
    userCartCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('cart');
    await loadCartItems();
    notifyListeners();
  }

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  Future<void> addToCart(
    String productId,
    Map<String, dynamic> productData,
  ) async {
    int index = _carts.indexWhere(
      (elements) => elements.productId == productId,
    );
    if (index != -1) {
      var existionItem = _carts[index];
      _carts[index] = CartModel(
        productId: productId,
        productData: productData,
        quntity: existionItem.quntity + 1,
      );
      await _updateCartInFirebase(productId, _carts[index].quntity);
    } else {
      _carts.add(
        CartModel(productId: productId, productData: productData, quntity: 1),
      );
      userCartCollection.doc(productId).set({
        "productData": productData,
        "quntity": 1,
        // "uid": FirebaseAuth.instance.currentUser?.uid,
      });
    }
    notifyListeners();
  }

  Future<void> addQuntity(String productId) async {
    int index = _carts.indexWhere((element) => element.productId == productId);
    _carts[index].quntity += 1;
    await _updateCartInFirebase(productId, carts[index].quntity);
    notifyListeners();
  }

  Future<void> decreaseQuntity(String productId) async {
    int index = _carts.indexWhere((element) => element.productId == productId);
    _carts[index].quntity -= 1;
    if (_carts[index].quntity <= 0) {
      _carts.removeAt(index);
      await userCartCollection.doc(productId).delete();
    } else {
      await _updateCartInFirebase(productId, carts[index].quntity);
    }

    notifyListeners();
  }

  Future<void> clearCart() async {
    try {
      // 1. Fetch all docs in the user’s cart subcollection
      final snapshot = await userCartCollection.get();

      // 2. Create a batch to delete them all in one go
      final batch = FirebaseFirestore.instance.batch();
      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }

      // 3. Commit the batch
      await batch.commit();

      // 4. Clear local list and notify listeners
      _carts.clear();
      notifyListeners();
    } catch (e) {
      debugPrint('Error clearing cart: $e');
    }
  }

  bool productExist(String productId) {
    return _carts.any((element) => element.productId == productId);
  }

  double totalCart() {
    double total = 0;
    for (var i = 0; i < _carts.length; i++) {
      total += _carts[i].quntity * _carts[i].productData['price'];
    }
    return total;
  }

  Future<void> loadCartItems() async {
    try {
      // QuerySnapshot snapshot =
      //     await userCartCollection
      //         .where("uid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
      //         .get();
      QuerySnapshot snapshot = await userCartCollection.get();
      _carts =
          snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;

            return CartModel(
              productId: doc.id,
              productData: data['productData'],
              quntity: data['quntity'],
            );
          }).toList();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteCartItem(String productId) async {
    int index = _carts.indexWhere((element) => element.productId == productId);
    if (index != -1) {
      _carts.removeAt(index);
      await userCartCollection.doc(productId).delete();
      notifyListeners();
    }
  }

  Future<void> _updateCartInFirebase(String productId, int quntity) async {
    try {
      await userCartCollection.doc(productId).update({"quntity": quntity});
    } catch (e) {
      print(e.toString());
    }
  }
}
