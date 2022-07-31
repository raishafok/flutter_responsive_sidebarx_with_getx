import 'dart:developer';
import 'package:flutter/foundation.dart';

class Extensions {}

extension StringLog on String {
  void printStr() {
    if (kDebugMode) {
      print(this);
    }
  }

  void logStr({
    String? name,
    Object? error,
  }) {
    return log(
      this,
      name: name ?? "",
      error: error,
    );
  }
}
