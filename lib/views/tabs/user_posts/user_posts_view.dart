import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_riverpod/state/posts/providers/user_posts_provider.dart';
import 'package:instagram_clone_riverpod/views/components/animation/empty_content_animation_with_text_view.dart';
import 'package:instagram_clone_riverpod/views/components/animation/error_contents_animation_view.dart';
import 'package:instagram_clone_riverpod/views/components/animation/loading_content_animation_view.dart';
import 'package:instagram_clone_riverpod/views/components/constants/strings.dart';
import 'package:instagram_clone_riverpod/views/components/post/posts_grid_view.dart';

class UserPostView extends ConsumerWidget {
  const UserPostView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(userPostsProvider);
    return RefreshIndicator(
      onRefresh: () {
        ref.refresh(userPostsProvider);
        return Future.delayed(const Duration(seconds: 1));
      },
      child: posts.when(data: (posts) {
        if (posts.isEmpty) {
          return const EmptyContentAnimationWithText(
            text: Strings.youHaveNoPosts,
          );
        } else {
          return PostsGrideView(
            posts: posts,
          );
        }
      }, error: (error, stackTrace) {
        return const ErrorAnimationView();
      }, loading: () {
        return const LoadingContentAnimationView();
      }),
    );
  }
}
