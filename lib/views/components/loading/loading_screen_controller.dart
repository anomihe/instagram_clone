import 'package:flutter/foundation.dart' show immutable;

typedef CloseLoadingScreen = bool Function();

typedef UpdateLoadingScreen = bool Function(String text);

@immutable
class LoadingScreenController {
  final CloseLoadingScreen closed;
  final UpdateLoadingScreen update;

  const LoadingScreenController({
    required this.closed,
    required this.update,
  });
}
