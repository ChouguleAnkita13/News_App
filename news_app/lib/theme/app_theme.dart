// app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static OutlineInputBorder commonOutlineInputBorder(
      {Color color = const Color.fromRGBO(34, 31, 31, 0.2)}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
      borderRadius: BorderRadius.circular(15),
    );
  }
  static TextStyle poppins({
    FontWeight fontWeight = FontWeight.w400,
    Color color = const Color.fromRGBO(34, 31, 31, 1),
    double fontSize = 14,
  }) {
    return GoogleFonts.poppins(
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
    );
  }

  static const Color primaryColor = Color.fromRGBO(255, 58, 68, 1);
  static const Color primaryLightColor = Color.fromRGBO(255, 128, 134, 1);
  static const Color textColor = Color.fromRGBO(34, 31, 31, 1);
  static const Color textColorLight = Color.fromRGBO(34, 31, 31, 0.6);
  static const Color iconColor = Color.fromRGBO(240, 241, 250, 1);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, primaryLightColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    textTheme: TextTheme(
      displayLarge: poppins(fontWeight: FontWeight.w700, fontSize: 45),
      titleLarge: poppins(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.black),
      titleMedium: poppins(fontWeight: FontWeight.w500, fontSize: 15, color: textColorLight),
      bodyLarge: poppins(),
      labelLarge: poppins(fontWeight: FontWeight.w600, fontSize: 21, color: Colors.white),
      bodySmall: poppins(fontWeight: FontWeight.w500, fontSize: 13, color: primaryColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: poppins(fontWeight: FontWeight.w400, color: textColorLight, fontSize: 14),
      enabledBorder: commonOutlineInputBorder(),
      focusedBorder: commonOutlineInputBorder(),
      errorBorder: commonOutlineInputBorder(),
      focusedErrorBorder: commonOutlineInputBorder(),
    ),
  );
}
