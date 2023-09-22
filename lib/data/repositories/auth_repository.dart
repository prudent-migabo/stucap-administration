import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository{
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore? ref = FirebaseFirestore.instance;

  Stream<User?> get user=> auth.userChanges();

  ///Login user to firebase
  Future login({required String email, required String password}) async {
       await auth.signInWithEmailAndPassword(
          email: email, password: password);
  }

  Future logout() async {
    await auth.signOut();
  }

}