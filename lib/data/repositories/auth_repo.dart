import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> login(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> register(String email, String password, String fullName) async {

    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await _firestore.collection('users').doc(credential.user!.uid).set({
      'fullName' : fullName,
      'email': email,
      'createdAt' : FieldValue.serverTimestamp(),
    });

    return credential;
  }





  Future<void> resetPassword (String email) async {
     await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async{
    await _auth.signOut();
  }

}
