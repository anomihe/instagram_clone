import 'package:instagram_clone_riverpod/views/components/animation/lottie_animation_view.dart';
import 'package:instagram_clone_riverpod/views/components/animation/models/lottie_animation.dart';

class ErrorAnimationView extends LottieAnimationView {
  const ErrorAnimationView({super.key})
      : super(animation: LottieAnimation.error);
}
