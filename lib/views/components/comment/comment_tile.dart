import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_riverpod/state/auth/provider/user_id_provider.dart';
import 'package:instagram_clone_riverpod/state/comment/models/comment.dart';
import 'package:instagram_clone_riverpod/state/providers/delete_comment_provider.dart';
import 'package:instagram_clone_riverpod/state/user_info/providers/user_info_model_provider.dart';
import 'package:instagram_clone_riverpod/views/components/animation/small_error_animation_view.dart';
import 'package:instagram_clone_riverpod/views/components/constants/strings.dart';
import 'package:instagram_clone_riverpod/views/components/dialog/alert_dialog_model.dart';
import 'package:instagram_clone_riverpod/views/components/dialog/delete_dialog.dart';

class CommentTile extends ConsumerWidget {
  final Comment comment;
  const CommentTile({super.key, required this.comment});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoModelProvider(
      comment.fromUserId,
    ));
    return userInfo.when(data: (userInfo) {
      final currentUserId = ref.read(userIdProvider);
      return ListTile(
        trailing: currentUserId == comment.fromUserId
            ? IconButton(
                onPressed: () async {
                  final shouldDeleteDialog = await displayDeleteDialog(context);
                  if (shouldDeleteDialog) {
                    await ref
                        .read(deleteCommentProvider.notifier)
                        .deleteComment(commentId: comment.id);
                  }
                },
                icon: const Icon(Icons.delete),
              )
            : null,
        title: Text(userInfo.displayName),
        subtitle: Text(
          comment.comment,
        ),
      );
    }, error: (error, stackeTrace) {
      return const SmallErrorAnimationView();
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  Future<bool> displayDeleteDialog(BuildContext context) =>
      const DeleteDialog(titleofObjectToDelete: Strings.comment)
          .present(context)
          .then((value) => value ?? false);
}
