import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    Color? backgroundColor,
    double? elevation,
    Brightness? brightness,
  }) : super(
          key: key,
          backgroundColor: backgroundColor ?? Colors.transparent,
          elevation: elevation ?? 0,
        );
}
