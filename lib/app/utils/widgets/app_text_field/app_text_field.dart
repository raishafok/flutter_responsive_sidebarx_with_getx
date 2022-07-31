import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_text_theme.dart';
import '../../../translations/translations_keys.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.hintText,
    this.errorText,
    this.obscureText,
  }) : super(key: key);
  final String? hintText;
  final String? errorText;
  final bool? obscureText;
  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final RxBool _obscureText = true.obs;
  @override
  void initState() {
    super.initState();
    _obscureText.value = widget.obscureText ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.neutral6,
              borderRadius: BorderRadius.circular(48),
            ),
            child: Obx(
              () => TextField(
                obscureText: _obscureText.value,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  hintStyle: AppTextStyles.head.neutral3Color.s14.roboto,
                  suffixIcon: widget.obscureText != null
                      ? GestureDetector(
                          onTap: () => _obscureText.value = !_obscureText.value,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: _obscureText.value
                                ? const Icon(CupertinoIcons.eye_slash)
                                : const Icon(CupertinoIcons.eye),
                          ),
                        )
                      : const SizedBox(),
                  suffixIconConstraints: const BoxConstraints(
                    maxWidth: 32,
                  ),
                ),
              ),
            ),
          ),
          if (widget.errorText != null && widget.errorText!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
                top: 4,
              ),
              child: Text(
                widget.errorText ?? AppTranslationKey.noEmpty,
                style: AppTextStyles.head.s14.redColor,
              ),
            ),
        ],
      ),
    );
  }
}
