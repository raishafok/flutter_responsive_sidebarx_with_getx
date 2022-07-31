
import 'package:get/get.dart';

import '../modules/home-module/home_binding.dart';
import '../screens/home-screen/home_screen.dart';
import '../screens/splash-screen/splash_screen.dart';
part './app_routes.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashScreen(),
    ),
  ];
}
