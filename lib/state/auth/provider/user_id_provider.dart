import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_riverpod/state/auth/provider/authStateProvider.dart';
import 'package:instagram_clone_riverpod/state/posts/typedefs/user_id.dart';

final userIdProvider = Provider<UserId?>((ref) {
  return ref.watch(authStateProvider).userId;
});
