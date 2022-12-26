import 'package:instagram_clone_riverpod/views/components/animation/lottie_animation_view.dart';
import 'package:instagram_clone_riverpod/views/components/animation/models/lottie_animation.dart';

class EmptyContentsAnimationView extends LottieAnimationView {
  const EmptyContentsAnimationView({super.key})
      : super(animation: LottieAnimation.empty);
}
