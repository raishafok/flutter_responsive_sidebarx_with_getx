import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../modules/home-module/home_controller.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/widgets/app_divider/app_divider.dart';

class SideBar extends GetWidget<HomeController> {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: controller.sideBarXController,
      showToggleButton: !context.isPhone,
      theme: _generateSideBarTheme(),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.canvasColor,
        ),
      ),
      footerDivider:
          AppDivider(color: AppColors.white.withOpacity(0.3), height: 1),
      headerBuilder: (context, extended) {
        return _buildSideBarHeader();
      },
      items: _buildSideBarItems(),
    );
  }

  Widget _buildSideBarHeader() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: CircleAvatar(
        radius: 35,
        backgroundImage: NetworkImage(
            "https://1.bp.blogspot.com/-0ZUMPsBahSo/X0vuBttwtWI/AAAAAAAAdwM/_0Nuxi-PWUsgTsLdAmGZqILPiJf7N2bdACLcBGAsYHQ/w320-h640/best%2Bdp%2Bfor%2Bwhatsapp%2B%25281%2529.jpg"),
      ),
    );
  }

  List<SidebarXItem> _buildSideBarItems() {
    return <SidebarXItem>[
      SidebarXItem(
        icon: Icons.home,
        label: 'Home',
        onTap: () {
          debugPrint('Home');
        },
      ),
      const SidebarXItem(
        icon: Icons.search,
        label: 'Search',
      ),
      const SidebarXItem(
        icon: Icons.people,
        label: 'People',
      ),
      const SidebarXItem(
        icon: Icons.favorite,
        label: 'Favorite',
      ),
      const SidebarXItem(
        iconWidget: FlutterLogo(size: 20),
        label: 'Flutter',
      ),
    ];
  }

  SidebarXTheme _generateSideBarTheme() {
    return SidebarXTheme(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.canvasColor,
        borderRadius: BorderRadius.circular(20),
      ),
      textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
      selectedTextStyle: const TextStyle(color: Colors.white),
      itemTextPadding: const EdgeInsets.only(left: 30),
      selectedItemTextPadding: const EdgeInsets.only(left: 30),
      itemDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.canvasColor),
      ),
      selectedItemDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.actionColor.withOpacity(0.37),
        ),
        gradient: const LinearGradient(
          colors: [AppColors.accentCanvasColor, AppColors.canvasColor],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.28),
            blurRadius: 30,
          )
        ],
      ),
      iconTheme: IconThemeData(
        color: Colors.white.withOpacity(0.7),
        size: 20,
      ),
      selectedIconTheme: const IconThemeData(
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
