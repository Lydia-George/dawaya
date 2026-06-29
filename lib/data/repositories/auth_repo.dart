import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  /// -- LOGIN
  Future<UserCredential> login(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// -- REGISTER
  Future<UserCredential> register(String email, String password,
      String fullName) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    try {
      await _firestore.collection('users').doc(credential.user!.uid).set({
        'fullName': fullName,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      }).timeout(Duration(
          seconds: 10
      ));
    } catch (e) {
      await credential.user?.delete();
      rethrow;
    }

    return credential;
  }


  /// -- RESET PASSWORD
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  /// SIGN IN WITH GOOGLE
  Future<UserCredential> signInWithGoogle() async {
    // open google accounts screen
    await GoogleSignIn.instance.initialize();

    final GoogleSignInAccount googleUser = await GoogleSignIn.instance.authenticate();

    final GoogleSignInAuthentication googleAuth =googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
         idToken: googleAuth.idToken);

    final userCredential = await _auth.signInWithCredential(credential);

    final isNewUser = userCredential
    .additionalUserInfo?.isNewUser ?? false;


    if(isNewUser){
      await _firestore.collection('users').doc(userCredential.user!.uid).set(
          {
            'fullName' : userCredential.user?.displayName ?? '',
            'email' : userCredential.user?.email ?? '',
            'createdAt' : FieldValue.serverTimestamp(),
          });
    }

    return userCredential;


  }

  /// -- LOGOUT
  Future<void> logout() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

}
