import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  UserService();

  final _auth = FirebaseAuth.instance;

  User? get currentUser {
    return _auth.currentUser;
  }

  Stream<User?> userChanges() {
    return _auth.userChanges();
  }

  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> updateProfile({
    String? displayName,
    String? photoURL,
  }) async {
    await currentUser?.updateProfile(
      displayName: displayName,
      photoURL: photoURL,
    );
  }
}
