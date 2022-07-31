import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';


class SplashScreen extends GetWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///Your Function in the Future
    Future.delayed(const Duration(seconds: 2), () {
      // 2s over, navigate to a new page
      Get.offNamed(AppRoutes.home);
    });

    ///Your widget
    return const Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
