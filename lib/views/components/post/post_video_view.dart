import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram_clone_riverpod/state/posts/models/post.dart';
import 'package:instagram_clone_riverpod/views/components/animation/error_contents_animation_view.dart';
import 'package:instagram_clone_riverpod/views/components/animation/loading_content_animation_view.dart';
import 'package:video_player/video_player.dart';

class PostVideoView extends HookWidget {
  final Post post;
  const PostVideoView({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    final controller = VideoPlayerController.network(
      post.fileUrl,
    );
    final isVideoPlayerReady = useState(false);
    useEffect(
      () {
        controller.initialize().then((value) {
          isVideoPlayerReady.value = true;
          controller.setLooping(true);
          controller.play();
        });
        return controller.dispose;
      },
      [controller],
    );
    switch (isVideoPlayerReady.value) {
      case true:
        return AspectRatio(
          aspectRatio: post.aspectRatio,
          child: VideoPlayer(controller),
        );
      case false:
        return const LoadingContentAnimationView();
      default:
        return const ErrorAnimationView();
    }
  }
}
