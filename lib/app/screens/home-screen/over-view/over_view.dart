import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../modules/home-module/home_controller.dart';
import '../../../utils/common.dart';

class OverView extends GetWidget<HomeController> {
  const OverView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: AnimatedBuilder(
        animation: controller.sideBarXController,
        builder: (context, child) {
          switch (controller.sideBarXController.selectedIndex) {
            case 0:
              return  Align(child:  Text("Home",style: theme.textTheme.headline5));
            default:
              return Center(
                child: Text(
                  Common.getTitleByIndex(controller.sideBarXController.selectedIndex),
                  style: theme.textTheme.headline5,
                ),
              );
          }
        },
      ),
    );
  }
}