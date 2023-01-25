import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_riverpod/state/post_setting/models/post_settings.dart';
import 'package:instagram_clone_riverpod/state/post_setting/notifiers/post_settings_notifier.dart';

final postSettingProvider =
    StateNotifierProvider<PostSettingNotifier, Map<PostSetting, bool>>((ref) {
  return PostSettingNotifier();
});
