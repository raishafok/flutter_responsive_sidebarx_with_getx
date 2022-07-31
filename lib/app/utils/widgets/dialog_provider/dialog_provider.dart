import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view_dialog/dialog_custom_widget.dart';

class DialogProvider {
  DialogProvider._();
  static void showDialogCustomWidget({
    required Widget content,
    String? title,
    VoidCallback? callback,
    TextStyle? titleStyle,
    double iconSize = 28,
    double? maxHeight,
    double? maxWidth,
    EdgeInsets? padding,
    EdgeInsets? margin,
  }) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => DialogCustomWidget(
        content,
        title: title,
        iconSize: iconSize,
        padding: padding,
        maxWidth: maxWidth,
        titleStyle: titleStyle,
        maxHeight: maxHeight,
      ),
    ).whenComplete(callback ?? () {});
  }
}
