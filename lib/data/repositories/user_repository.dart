import 'package:chat/data/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  UserRepository();

  final _service = UserService();

  User? get currentUser => _service.currentUser;

  Stream<User?> userChanges() => _service.userChanges();

  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _service.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _service.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() => _service.signOut();
}
