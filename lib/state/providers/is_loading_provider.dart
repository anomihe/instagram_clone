import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_riverpod/state/auth/provider/authStateProvider.dart';

final isLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.isLoading;
});
