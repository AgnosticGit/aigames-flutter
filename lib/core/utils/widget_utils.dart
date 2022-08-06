import 'package:flutter/material.dart';

class WidgetUtils {
  static Size? getSize(GlobalKey key) {
    final box = key.currentContext?.findRenderObject() as RenderBox?;
    return box?.size;
  }

  static Offset? getPosition(GlobalKey key) {
    final box = key.currentContext?.findRenderObject() as RenderBox?;
    return box?.localToGlobal(Offset.zero);
  }
}
