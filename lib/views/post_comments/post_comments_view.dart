import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram_clone_riverpod/state/auth/provider/user_id_provider.dart';
import 'package:instagram_clone_riverpod/state/comment/models/post_comment_request.dart';
import 'package:instagram_clone_riverpod/state/posts/typedefs/post_id.dart';
import 'package:instagram_clone_riverpod/state/providers/post_comments_provider.dart';
import 'package:instagram_clone_riverpod/state/providers/send_comment_provider.dart';
import 'package:instagram_clone_riverpod/views/components/animation/empty_content_animation_with_text_view.dart';
import 'package:instagram_clone_riverpod/views/components/animation/error_contents_animation_view.dart';
import 'package:instagram_clone_riverpod/views/components/animation/loading_content_animation_view.dart';
import 'package:instagram_clone_riverpod/views/components/comment/comment_tile.dart';
import 'package:instagram_clone_riverpod/views/components/constants/strings.dart';
import 'package:instagram_clone_riverpod/views/extensions/dismiss_keyboard.dart';

class PostCommentsView extends HookConsumerWidget {
  final PostId postId;
  const PostCommentsView({
    super.key,
    required this.postId,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentController = useTextEditingController();
    final hasText = useState(false);
    final request = useState(RequestForPostAndComment(
      postId: postId,
    ));
    final comments = ref.watch(postCommentsProvier(
      request.value,
    ));
    useEffect(() {
      commentController.addListener(() {
        hasText.value = commentController.text.isNotEmpty;
      });
      return () {};
    }, [commentController]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.comment),
        actions: [
          IconButton(
              onPressed: hasText.value
                  ? () {
                      _submitCommentWithController(
                        commentController,
                        ref,
                      );
                    }
                  : null,
              icon: const Icon(Icons.send))
        ],
      ),
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 4,
              child: comments.when(data: (comment) {
                if (comment.isEmpty) {
                  return const SingleChildScrollView(
                    child: EmptyContentAnimationWithText(
                      text: Strings.noCommentsYet,
                    ),
                  );
                }
                return RefreshIndicator(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: comment.length,
                        itemBuilder: (context, index) {
                          final commen = comment.elementAt(index);
                          return CommentTile(
                            comment: commen,
                          );
                        }),
                    onRefresh: () {
                      ref.refresh(
                        postCommentsProvier(
                          request.value,
                        ),
                      );
                      return Future.delayed(
                        const Duration(
                          seconds: 1,
                        ),
                      );
                    });
              }, error: (error, stacttrace) {
                return const ErrorAnimationView();
              }, loading: () {
                return const LoadingContentAnimationView();
              }),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: TextField(
                    textInputAction: TextInputAction.send,
                    controller: commentController,
                    onSubmitted: (comment) {
                      if (comment.isNotEmpty) {
                        _submitCommentWithController(commentController, ref);
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: Strings.writeYourCommentHere,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitCommentWithController(
    TextEditingController controller,
    WidgetRef ref,
  ) async {
    final userId = ref.read(userIdProvider);
    if (userId == null) {
      return;
    }
    final isSent = await ref.read(sendCommentProvider.notifier).sendComment(
          fromUserId: userId,
          onPostId: postId,
          comment: controller.text,
        );
    if (isSent) {
      controller.clear();
      dismissKeyboard();
    }
  }
}
