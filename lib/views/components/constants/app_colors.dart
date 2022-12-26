import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart' show Colors;
import 'package:instagram_clone_riverpod/extensions/string/as_html_color_to_color.dart';

@immutable
class AppColor {
  static final loginButtonColor = '#cfc9c2'.htmlColorToColor();
  static const loginButtoonTextColor = Colors.black;
  static final googleColor = '#4285F4'.htmlColorToColor();
  static final facebookColor = '#3b5998'.htmlColorToColor();
  const AppColor._();
}
