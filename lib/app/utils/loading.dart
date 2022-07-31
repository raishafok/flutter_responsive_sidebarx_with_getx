import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_theme.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
    this.title,
    this.opacity,
    this.loadingType = LoadingType.chasingDots,
  }) : super(key: key);

  final String? title;
  final double? opacity;
  final LoadingType loadingType;

  Widget getLoading() {
    switch (loadingType) {
      case LoadingType.dualRing:
        return const SpinKitDualRing(
          color: AppColors.primaryLightColor,
          size: 50,
        );
      case LoadingType.doubleBounce:
        return const SpinKitDoubleBounce(
          color: AppColors.primaryLightColor,
          size: 50,
        );
      default:
        return const SpinKitChasingDots(
          color: AppColors.primaryLightColor,
          size: 50,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white.withOpacity(opacity ?? 1),
      body: Stack(
        children: [
          Center(
            child: getLoading(),
          ),
          if (title != null)
            Positioned(
              bottom: 20,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SafeArea(
                  child: Center(
                    child: Text(
                      title!,
                      style: AppTextStyles.head.w700.s16.whiteColor,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

enum LoadingType {
  dualRing,
  chasingDots,
  doubleBounce,
}
