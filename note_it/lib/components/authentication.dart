import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  static FirebaseAuth firebaseAuth;

  AuthenticationService(FirebaseAuth _firebaseAuth) {
    AuthenticationService.firebaseAuth = _firebaseAuth;
  }

  Stream<User> get authStateChanges => firebaseAuth.idTokenChanges();

  // Sign In
  Future<String> signIn({String email, String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //Sign Up
  Future<String> signUp({String email, String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Sign Out
  static Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}