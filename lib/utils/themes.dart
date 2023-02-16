import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
    elevatedButtonTheme: elevatedButtonThemeData);

final elevatedButtonThemeData = ElevatedButtonThemeData(
    style: TextButton.styleFrom(
        backgroundColor: AppColors.alternativeColor,
        padding: const EdgeInsets.all(8),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3)))));
