import 'package:flutter/foundation.dart' show immutable;
import 'package:instagram_clone_riverpod/views/components/constants/strings.dart';
import 'package:instagram_clone_riverpod/views/components/dialog/alert_dialog_model.dart';

@immutable
class LogoutDialog extends AlertDialogModel<bool> {
  const LogoutDialog()
      : super(
            title: Strings.logOut,
            message: Strings.areYouSureThatYouWantToLogOutOfTheApp,
            buttons: const {
              Strings.cancel: false,
              Strings.logOut: true,
            });
}
