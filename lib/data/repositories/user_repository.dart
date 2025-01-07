import 'package:chat/data/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  UserRepository();

  final _service = UserService();

  User? get user {
    return _service.currentUser;
  }

  Stream<User?> userChanges() {
    return _service.userChanges();
  }

  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) {
    return _service.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) {
    return _service.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _service.signOut();
  }

  Future<void> updateProfile({
    String? name,
    String? imageURL,
  }) async {
    await _service.updateProfile(
      displayName: name ?? user?.displayName,
      photoURL: imageURL ?? user?.photoURL,
    );
  }
}
