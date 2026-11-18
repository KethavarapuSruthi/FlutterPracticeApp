import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../services/user_service.dart';

final userViewModelProvider =
    AsyncNotifierProvider<UserViewModel, User?>(UserViewModel.new);

class UserViewModel extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async => null; // nothing loaded at start

  Future<void> loadUser() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(userServiceProvider).fetchUser(),
    );
  }
}