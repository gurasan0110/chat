import 'package:chat/data/services/user_service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DefaultUserService implements UserService {
  const DefaultUserService();

  @override
  User? get currentUser => FirebaseAuth.instance.currentUser;

  @override
  Stream<User?> userChanges() => FirebaseAuth.instance.userChanges();
}
