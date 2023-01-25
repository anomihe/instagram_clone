import 'package:flutter/foundation.dart' show immutable;
import 'package:instagram_clone_riverpod/views/components/constants/strings.dart';
import 'package:instagram_clone_riverpod/views/components/dialog/alert_dialog_model.dart';

@immutable
class DeleteDialog extends AlertDialogModel<bool> {
  const DeleteDialog({required String titleofObjectToDelete})
      : super(
          title: '${Strings.delete} $titleofObjectToDelete',
          message:
              '${Strings.areYouSureYouWantToDeleteThis} $titleofObjectToDelete',
          buttons: const {
            Strings.cancel: false,
            Strings.delete: true,
          },
        );
}
