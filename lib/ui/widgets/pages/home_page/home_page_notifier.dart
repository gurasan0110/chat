import 'package:chat/data/repositories/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_notifier.g.dart';

@riverpod
class HomePageNotifier extends _$HomePageNotifier {
  HomePageNotifier();

  @override
  User? build() {
    final repository = ref.watch(userRepositoryProvider);
    repository.userChanges().listen((user) => state = user);
    return repository.currentUser;
  }
}
