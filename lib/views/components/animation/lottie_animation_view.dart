import 'package:flutter/material.dart';
import 'package:instagram_clone_riverpod/views/components/animation/models/lottie_animation.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationView extends StatelessWidget {
  final LottieAnimation animation;
  final bool repeat;
  final bool reverse;

  const LottieAnimationView(
      {required this.animation,
      this.repeat = true,
      this.reverse = false,
      super.key});

  @override
  Widget build(BuildContext context) => Lottie.asset(
        animation.fullPath,
        repeat: repeat,
        reverse: reverse,
      );
}

extension GetFullPath on LottieAnimation {
  String get fullPath => 'assets/animation/$name.json';
}
