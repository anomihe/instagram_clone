import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:instagram_clone_riverpod/state/image_upload/models/file_type.dart';
import 'package:instagram_clone_riverpod/state/post_setting/models/post_settings.dart';
import 'package:instagram_clone_riverpod/state/posts/models/post_key.dart';
import 'package:instagram_clone_riverpod/state/posts/typedefs/user_id.dart';

@immutable
class PostPayload extends MapView<String, dynamic> {
  // final UserId userId;
  // final String message;
  // final String thumbnailUrl;
  // final String fileUrl;
  // final FileType fileType;
  // final String fileName;
  // final double aspectRatio;
  // final String thumbnailStorageId;
  // final String originalFileStorageId;

  PostPayload({
    required UserId userId,
    required String message,
    required String thumbnailUrl,
    required String fileUrl,
    required FileType fileType,
    required String fileName,
    required double aspectRatio,
    required String thumbnailStorageId,
    required String originalFileStorageId,
    required Map<PostSetting, bool> postSettings,
  }) : super({
          PostKey.userId: userId,
          PostKey.message: message,
          PostKey.createdAt: FieldValue.serverTimestamp(),
          PostKey.thumbnailUrl: thumbnailUrl,
          PostKey.fileUrl: fileUrl,
          PostKey.fileType: fileType.name,
          PostKey.thumbnailStorageId: thumbnailStorageId,
          PostKey.originalFileStorageId: originalFileStorageId,
          PostKey.postSettings: {
            for (final postSetting in postSettings.entries)
              postSetting.key.storageKey: postSetting.value
          }
        });
}
