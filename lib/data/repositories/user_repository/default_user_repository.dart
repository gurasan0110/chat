import 'package:chat/data/repositories/user_repository/user_repository.dart';
import 'package:chat/data/services/user_service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DefaultUserRepository implements UserRepository {
  const DefaultUserRepository(this._service);

  final UserService _service;

  @override
  User? get currentUser => _service.currentUser;

  @override
  Stream<User?> userChanges() => _service.userChanges();
}
