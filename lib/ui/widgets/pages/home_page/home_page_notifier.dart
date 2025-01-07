import 'package:chat/data/repositories/user_repository.dart';
import 'package:chat/ui/widgets/pages/home_page/home_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_notifier.g.dart';

@riverpod
class HomePageNotifier extends _$HomePageNotifier {
  HomePageNotifier();

  final _repository = UserRepository();

  @override
  HomePageState build() {
    final sub = _repository.userChanges().listen((user) {
      state = state.copyWith(user: user);
    });

    ref.onDispose(sub.cancel);

    return HomePageState(user: _repository.user);
  }

  void setEmail(String email) {
    final trimmedEmail = email.trim();
    state = state.copyWith(email: trimmedEmail);
  }

  void setPassword(String password) {
    final trimmedPassword = password.trim();
    state = state.copyWith(password: trimmedPassword);
  }

  void toggleObscureText() {
    state = state.copyWith(obscureText: !state.obscureText);
  }

  Future<void> signUp() async {
    await _repository.signUp(
      email: state.email,
      password: state.password,
    );
  }

  Future<void> signIn() async {
    await _repository.signIn(
      email: state.email,
      password: state.password,
    );
  }

  Future<void> signOut() async {
    await _repository.signOut();
  }
}
