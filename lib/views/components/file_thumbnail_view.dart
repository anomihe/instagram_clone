import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_riverpod/state/image_upload/models/thumbnail_request.dart';
import 'package:instagram_clone_riverpod/state/image_upload/provider/thumbnail_provider.dart';
import 'package:instagram_clone_riverpod/views/components/animation/loading_content_animation_view.dart';
import 'package:instagram_clone_riverpod/views/components/animation/small_error_animation_view.dart';

class FileThumnailView extends ConsumerWidget {
  final ThumbnailRequest thumbnailRequest;
  const FileThumnailView({
    super.key,
    required this.thumbnailRequest,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnail = ref.watch(thumbnailProvider(thumbnailRequest));
    return thumbnail.when(data: (imageWithAspectRatio) {
      return AspectRatio(
        aspectRatio: imageWithAspectRatio.aspectRatio,
        child: imageWithAspectRatio.image,
      );
    }, error: (error, st) {
      return const SmallErrorAnimationView();
    }, loading: () {
      return const LoadingContentAnimationView();
    });
  }
}
