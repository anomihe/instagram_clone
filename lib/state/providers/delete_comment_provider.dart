import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_riverpod/state/comment/notifier/delete_comment_notifier.dart';
import 'package:instagram_clone_riverpod/state/image_upload/typedefs/is_loading.dart';

final deleteCommentProvider =
    StateNotifierProvider<DeleteCommentStateNotifier, IsLoading>((_) {
  return DeleteCommentStateNotifier();
});
