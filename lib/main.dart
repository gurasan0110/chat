import 'package:chat/app.dart';
import 'package:chat/data/repositories/user_repository/default_user_repository.dart';
import 'package:chat/data/repositories/user_repository/user_repository.dart';
import 'package:chat/data/services/user_service/default_user_service.dart';
import 'package:chat/data/services/user_service/user_service.dart';
import 'package:chat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ProviderScope(
    overrides: [
      userServiceProvider.overrideWithValue(DefaultUserService()),
      userRepositoryProvider.overrideWith(
        (ref) => DefaultUserRepository(ref.watch(userServiceProvider)),
      ),
    ],
    child: const App(),
  ));
}
