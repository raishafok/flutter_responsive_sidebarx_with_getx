import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../themes/app_colors.dart';
import '../../../../themes/app_text_theme.dart';
import '../../app_button/base_button.dart';
import '../../app_divider/app_divider.dart';

class DialogCustomWidget extends StatelessWidget {
  const DialogCustomWidget(
    this.content, {
    Key? key,
    this.title,
    this.titleStyle,
    this.iconSize = 28,
    this.maxHeight,
    this.maxWidth,
    this.padding,
  }) : super(key: key);

  final Widget content;
  final String? title;
  final TextStyle? titleStyle;
  final double iconSize;
  final double? maxHeight;
  final double? maxWidth;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        constraints: BoxConstraints(maxWidth: maxWidth ?? Get.width / 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0).copyWith(bottom: 0),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: title == null
                        ? const SizedBox()
                        : Center(
                            child: Text(
                              title ?? "",
                              style: AppTextStyles.head.w600.blackColor,
                            ),
                          ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: BaseButton(
                        child: Icon(
                          Icons.clear,
                          color: AppColors.lightGray,
                          size: iconSize,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (title != null)
              const Padding(
                padding: EdgeInsets.only(top: 12),
                child: AppDivider(),
              ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: maxHeight ?? Get.height / 2.5,
              ),
              child: SingleChildScrollView(
                padding: padding ?? const EdgeInsets.all(16),
                child: content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
