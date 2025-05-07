import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/user.dart';
import '../../data/auth_repo.dart';

final loginUserStateProvider = Provider.autoDispose<AsyncValue<bool>>((ref) {
  final query = ref.watch(loginUserQueryProvider);

  return query.match(() => const AsyncData(false),
      (value) => ref.watch(loginUserFutureProvider(value)));
});

final loginUserQueryProvider =
    StateProvider.autoDispose<Option<User>>((_) => const None());

final loginUserFutureProvider =
    FutureProvider.autoDispose.family<bool, User>((ref, user) async {
  final repository = ref.read(authRepoProvider);
  return await repository.loginUser(user.userName, user.password);
});
