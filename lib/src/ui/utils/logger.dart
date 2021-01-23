

import 'package:flutter/material.dart';

class MyLogger{
  static print(String message, {bool isWrapWidth = false, bool isError = false}) {
    if (isWrapWidth) {
      debugPrint(message, wrapWidth: 1024);
    } else {
      debugPrint(message);
    }
  }
}