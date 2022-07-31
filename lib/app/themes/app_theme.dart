import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppThemes {
 const AppThemes._();

    static final ThemeData lightTheme = ThemeData(
    primarySwatch: AppColors.primaryLightColor,
    primaryColor: AppColors.primaryLightColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.sourceSansProTextTheme(),
  );

    static final ThemeData darkTheme = ThemeData(
    primarySwatch: AppColors.primaryDarkColor,
    primaryColor: AppColors.primaryDarkColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.sourceSansProTextTheme(),
  );







}
