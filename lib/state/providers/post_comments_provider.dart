import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_riverpod/state/comment/extensions/comment_sorting_by_request.dart';
import 'package:instagram_clone_riverpod/state/comment/models/comment.dart';
import 'package:instagram_clone_riverpod/state/comment/models/post_comment_request.dart';
import 'package:instagram_clone_riverpod/state/constants/firebase_collection_name.dart';
import 'package:instagram_clone_riverpod/state/constants/firebase_field_name.dart';

final postCommentsProvier = StreamProvider.family
    .autoDispose<Iterable<Comment>, RequestForPostAndComment>(
        (ref, RequestForPostAndComment request) {
  final controller = StreamController<Iterable<Comment>>();
  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.comments)
      .where(
        FirebaseFieldName.postId,
        isEqualTo: request.postId,
      )
      .snapshots()
      .listen(
    (snapshot) {
      final document = snapshot.docs;
      final limitedDocuments =
          request.limit != null ? document.take(request.limit!) : document;
      final comments = limitedDocuments
          .where(
            (doc) => !doc.metadata.hasPendingWrites,
          )
          .map(
            (document) => Comment(
              document.data(),
              id: document.id,
            ),
          );
      final result = comments.applySortingFrom(request);
      controller.sink.add(result);
    },
  );
  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });
  return controller.stream;
});
