import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_service.g.dart';

@Riverpod(keepAlive: true)
UserService userService(Ref ref) => throw UnimplementedError();

abstract class UserService {
  const UserService();

  User? get currentUser;

  Stream<User?> userChanges();
}
