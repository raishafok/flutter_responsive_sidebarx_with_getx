import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';

class AppDivider extends Divider {
  const AppDivider({
    Key? key,
    Color color = AppColors.colorDivider,
    double height = 1.5,
  }) : super(
          key: key,
          color: color,
          height: height,
          thickness: 1.5,
        );
}

class AppVerticalDivider extends StatelessWidget {
  const AppVerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      color: AppColors.colorDivider,
      width: 1,
    );
  }
}

class AppDefaultVertical extends StatelessWidget {
  const AppDefaultVertical({
    Key? key,
    this.height = 0,
    this.color = AppColors.colorDivider,
  }) : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: height,
      width: 1,
    );
  }
}


class AppDefaultHorizontal extends StatelessWidget {
  const AppDefaultHorizontal({
    Key? key,
    this.height = 0,
    this.color = AppColors.colorDivider,
  }) : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: height,
      width: 1,
    );
  }
}

class AppDashDivider extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const AppDashDivider({
    Key? key,
    this.height = 1,
    this.width = 10,
    this.color = AppColors.colorDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = width;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
