import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/home-module/home_controller.dart';
import '../../themes/app_colors.dart';
import '../../utils/common.dart';
import 'over-view/over_view.dart';
import 'widgets/side_bar.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.key,
      drawer: const SideBar(),
      appBar: _buildAppBar(context),
      body: _buildHomeBody(context),
    );
  }

  AppBar? _buildAppBar(BuildContext context) {
    return context.isPhone
        ? AppBar(
            backgroundColor: AppColors.canvasColor,
            title: Text(
                Common.getTitleByIndex(controller.sideBarXController.selectedIndex)),
            leading: IconButton(
              onPressed: () {
                controller.sideBarXController.setExtended(true);
                controller.key.currentState?.openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
          )
        : null;
  }

  Widget _buildHomeBody(BuildContext context) {
    return Row(
      children: [
        if (!context.isPhone) const SideBar(),
        const OverView(),
      ],
    );
  }

 
}
