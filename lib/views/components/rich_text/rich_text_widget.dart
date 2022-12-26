import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_riverpod/views/components/rich_text/base_text.dart';
import 'package:instagram_clone_riverpod/views/components/rich_text/link_text.dart';

// @immutable
class RichTextWidget extends StatelessWidget {
  final TextStyle? styleForAll;
  final Iterable<BaseText> text;
  const RichTextWidget({
    super.key,
    required this.text,
    this.styleForAll,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            children: text.map((baseText) {
      if (baseText is LinkText) {
        return TextSpan(
          text: baseText.text,
          style: styleForAll?.merge(baseText.style),
          recognizer: TapGestureRecognizer()..onTap = baseText.onTapped,
        );
      } else {
        return TextSpan(
          text: baseText.text,
          style: styleForAll?.merge(baseText.style),
        );
      }
    }).toList()));
  }
}
