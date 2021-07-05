import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final googleSignIn = GoogleSignIn();

  // if currently tring to sign in
  bool? _isSigningIn;
  // to get the current log in state
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  AuthProvider(this._firebaseAuth) {
    _isSigningIn = false;
  }

  bool get isSigningIn => _isSigningIn!;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future googleLogin() async {
    isSigningIn = true;
    try {
      final user = await googleSignIn.signIn();
      if (user == null) {
        isSigningIn = false;
        return;
      } else {
        final googleAuth = await user.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await _firebaseAuth.signInWithCredential(credential);

        isSigningIn = false;
      }
    } on FirebaseAuthException catch (e) {
      // add methods to check if user exists or other
      rethrow;
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    _firebaseAuth.signOut();
  }
}
