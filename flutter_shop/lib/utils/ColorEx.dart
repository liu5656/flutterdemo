import 'dart:math';

import 'package:flutter/material.dart';

class ColorUtil {
  static Color hexColor(int hex, {double alpha = 1}) {
    alpha = min(max(0, alpha), 1);
    return Color.fromRGBO((hex & 0xff0000) >> 16, (hex & 0x00ff00) >> 8, (hex & 0x0000ff), alpha);
  }
}