import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/utils/color_manager.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: ColorManager.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primary,
      centerTitle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70) , bottomRight: Radius.circular(70) )
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.exo(
        fontWeight: FontWeight.bold,
        fontSize: 22,
          color: ColorManager.white
      ),titleMedium: GoogleFonts.exo(
        fontSize: 14,
          color: ColorManager.white
      )
    )
  );

}