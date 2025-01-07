import 'package:firebase_auth/firebase_auth.dart';

extension UserExtension on User {
  bool get hasProfile {
    return displayName != null && photoURL != null;
  }
}
