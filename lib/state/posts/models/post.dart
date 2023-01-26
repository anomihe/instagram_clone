import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:instagram_clone_riverpod/state/image_upload/models/file_type.dart';
import 'package:instagram_clone_riverpod/state/post_setting/models/post_settings.dart';
import 'package:instagram_clone_riverpod/state/posts/models/post_key.dart';

@immutable
class Post {
  final String postId;
  final String userId;
  final String message;
  final DateTime createdAt;
  final String thumbnailUrl;
  final String fileUrl;
  final FileType fileType;
  final String fileName;
  final double aspectRatio;
  final String thumbnailStorageId;
  final String originalFIleStorageId;
  final Map<PostSetting, bool> postSettings;

  Post({
    required this.postId,
    required Map<String, dynamic> json,
  })  : userId = json[PostKey.userId],
        message = json[PostKey.message],
        createdAt = (json[PostKey.createdAt] as Timestamp).toDate(),
        thumbnailUrl = json[PostKey.thumbnailUrl],
        fileUrl = json[PostKey.fileUrl],
        fileName = json[PostKey.fileName],
        aspectRatio = json[PostKey.aspectRatio],
        fileType = FileType.values.firstWhere(
          (fileType) => fileType.name == json[PostKey.fileType],
          orElse: () => FileType.image,
        ),
        thumbnailStorageId = json[PostKey.thumbnailStorageId],
        originalFIleStorageId = json[PostKey.originalFileStorageId],
        postSettings = {
          for (final entry in json[PostKey.postSettings].entries)
            PostSetting.values
                    .firstWhere((element) => element.storageKey == entry.key):
                entry.value,
        };

  bool get allowLikes => postSettings[PostSetting.allowLikes] ?? false;
  bool get allowComment => postSettings[PostSetting.allowComents] ?? false;
}
