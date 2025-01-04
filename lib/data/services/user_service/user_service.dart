import 'package:firebase_auth/firebase_auth.dart';

abstract class UserService {
  const UserService();

  User? get currentUser;

  Stream<User?> userChanges();

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
