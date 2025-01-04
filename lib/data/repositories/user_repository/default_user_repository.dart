import 'package:chat/data/repositories/user_repository/user_repository.dart';
import 'package:chat/data/services/user_service/default_user_service.dart';
import 'package:chat/data/services/user_service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DefaultUserRepository implements UserRepository {
  DefaultUserRepository({
    UserService? service,
  }) : _service = service ?? DefaultUserService();

  final UserService _service;

  @override
  User? get currentUser => _service.currentUser;

  @override
  Stream<User?> userChanges() => _service.userChanges();

  @override
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _service.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _service.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() => _service.signOut();
}
