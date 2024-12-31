import 'package:chat/data/repositories/user_repository/user_repository.dart';
import 'package:chat/ui/widgets/pages/home_page/home_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_notifier.g.dart';

@riverpod
class HomePageNotifier extends _$HomePageNotifier {
  HomePageNotifier();

  late final _repository = ref.watch(userRepositoryProvider);

  @override
  HomePageState build() {
    final sub = _repository
        .userChanges()
        .listen((user) => state = state.copyWith(user: user));

    ref.onDispose(sub.cancel);

    return HomePageState(user: _repository.currentUser);
  }

  void setEmail(String email) => state = state.copyWith(email: email);

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<void> createUserWithEmailAndPassword() async {
    await _repository.createUserWithEmailAndPassword(
      email: state.email,
      password: state.password,
    );
  }

  Future<void> signInWithEmailAndPassword() async {
    await _repository.signInWithEmailAndPassword(
      email: state.email,
      password: state.password,
    );
  }

  Future<void> signOut() => _repository.signOut();
}
