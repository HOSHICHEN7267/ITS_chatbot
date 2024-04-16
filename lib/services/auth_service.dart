import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    // instance of auth
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    // instance of firestore
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    await _firebaseAuth.signInWithCredential(credential);

    var strList = _firebaseAuth.currentUser!.email?.split('@');
    String userName = strList![0].trim();

    await _firestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .set({
      'uid': _firebaseAuth.currentUser!.uid,
      'name': userName,
      'email': _firebaseAuth.currentUser!.email,
    }, SetOptions(merge: true));
  }
}
