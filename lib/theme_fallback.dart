import 'package:flutter/material.dart';

extension _BackgroundColorFallback on ThemeData {
  Color get backgroundColor => colorScheme.background;
}
