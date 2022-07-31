import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../../themes/app_text_theme.dart';

class BottomSheetProvider {
  static showDatePicker(
      BuildContext context, DateTime now, Function(DateTime) callback,
      {LocaleType locale = LocaleType.en, int minusTime = 1}) {
    DatePicker.showDatePicker(context,
        minTime: DateTime(now.year - minusTime, 0, 0),
        maxTime: DateTime(now.year + minusTime, 0, 0),
        theme: DatePickerTheme(
          headerColor: Colors.white,
          backgroundColor: Colors.white,
          itemStyle: AppTextStyles.head.w400.blackColor,
          doneStyle: AppTextStyles.head.w500,
          cancelStyle: AppTextStyles.head.w500,
        ), onConfirm: (date) {
      callback(date);
    }, currentTime: now, locale: locale);
  }

  static showDateTimePicker(
      BuildContext context, DateTime now, Function(DateTime) callback,
      {LocaleType locale = LocaleType.en, int minusTime = 1}) {
    DatePicker.showDateTimePicker(context,
        minTime: DateTime(now.year - minusTime, 0, 0),
        maxTime: DateTime(now.year + minusTime, 0, 0),
        theme: DatePickerTheme(
          headerColor: Colors.white,
          backgroundColor: Colors.white,
          itemStyle: AppTextStyles.head.w400.blackColor,
          doneStyle: AppTextStyles.head.w500,
          cancelStyle: AppTextStyles.head.w500,
        ), onConfirm: (date) {
      callback(date);
    }, currentTime: now, locale: locale);
  }

  static showTimePicker(
      BuildContext context, DateTime now, Function(DateTime) callback,
      {LocaleType locale = LocaleType.en}) {
    DatePicker.showTimePicker(context,
        theme: DatePickerTheme(
          headerColor: Colors.white,
          backgroundColor: Colors.white,
          itemStyle: AppTextStyles.head.blackColor,
          doneStyle: AppTextStyles.head.w500,
          cancelStyle: AppTextStyles.head.w500,
        ), onConfirm: (date) {
      callback(date);
    }, showSecondsColumn: false, currentTime: now, locale: locale);
  }

  // static showBottomSheetWithHeader({
  //   Widget content,
  //   String title,
  //   double? maxHeight,
  //   EdgeInsets padding,
  //   VoidCallback callback,
  // }) {
  //   showModalBottomSheet(
  //     context: Get.context!,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (context) {
  //       return Container(
  //         padding: const EdgeInsets.symmetric(vertical: 16),
  //         margin:
  //             EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  //         height: maxHeight ?? 357,
  //         decoration: BoxDecoration(
  //           color: AppColors.white,
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(12),
  //             topRight: Radius.circular(12),
  //           ),
  //         ),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Stack(
  //               children: [
  //                 SizedBox(
  //                   width: double.infinity,
  //                   child: title == null
  //                       ? SizedBox()
  //                       : Center(
  //                           child: Text(
  //                             title,
  //                             style: AppTextStyles.medium16Black,
  //                           ),
  //                         ),
  //                 ),
  //                 Align(
  //                   alignment: Alignment.centerRight,
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(right: 16),
  //                     child: headButton(
  //                       child: Icon(
  //                         Icons.clear,
  //                         color: ColorsConstant.colorLightGray,
  //                       ),
  //                       onPressed: () {
  //                         Get.back();
  //                       },
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             if (title != null) ...[SizedBox(height: 13), AppDivider.head()],
  //             SizedBox(height: 16),
  //             Expanded(
  //               child: Padding(
  //                 padding: padding ?? EdgeInsets.zero,
  //                 child: content,
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   ).whenComplete(callback ?? () {});
  // }
}
