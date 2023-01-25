import 'package:instagram_clone_riverpod/state/image_upload/models/file_type.dart';

extension CollectName on FileType {
  String get collectionName {
    switch (this) {
      case FileType.image:
        return 'images';
      case FileType.video:
        return 'videos';
    }
  }
}
