import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // ignore: deprecated_member_use
  Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
  );

  Future <String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser()).uid;
  }
  Future getCurrentUser() async {
    return (await _firebaseAuth.currentUser);
  }

  // Email & Password Sign Up
  Future<String> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  // Email & Password Sign In
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).uid;
  }

  // Sign Out
  signOut() {
    return _firebaseAuth.signOut();
  }

}
