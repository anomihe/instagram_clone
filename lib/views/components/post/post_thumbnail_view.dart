import 'package:flutter/material.dart';
import 'package:instagram_clone_riverpod/state/posts/models/post.dart';

class PostThumbnailView extends StatelessWidget {
  final Post post;
  final VoidCallback onTapped;
  const PostThumbnailView({
    required this.post,
    required this.onTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Image.network(
        post.thumbnailUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
