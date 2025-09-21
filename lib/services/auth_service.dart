import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference usersCollection = FirebaseFirestore.instance
      .collection('users');

  Stream<DocumentSnapshot<Object?>> getUser() {
    return usersCollection.doc(auth.currentUser?.uid).snapshots();
  }

  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Optionally, you can create a user document in Firestore
      await firestore.collection('users').doc(userCredential.user?.uid).set({
        'name': name,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
      return "success";
    } catch (e) {
      return "$e";
    }
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      // final idToken = await user.getIdToken(true); // true forces a refresh
      log("user id " + FirebaseAuth.instance.currentUser!.uid);
      return "success";
    } catch (e) {
      return "$e";
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  Future<bool> isLoggedIn() async {
    User? user = auth.currentUser;
    return user != null;
  }
}
