import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../data/provider/home_provider.dart';

class HomeController extends GetxController {
  HomeController({this.provider});
  final HomeProvider? provider;

    final sideBarXController = SidebarXController(selectedIndex: 0, extended: true);

      final key = GlobalKey<ScaffoldState>();


}
