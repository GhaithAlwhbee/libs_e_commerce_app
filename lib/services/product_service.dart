import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final CollectionReference productsCollection = FirebaseFirestore.instance
      .collection('products');
  final CollectionReference categoryCollection = FirebaseFirestore.instance
      .collection('category');
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getProducts() {
    return productsCollection.snapshots();
  }
}
