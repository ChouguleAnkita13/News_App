import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart';

/// A CUSTOM WIDGET TO DISPLAY A BUTTON WITH A GRADIENT BACKGROUND AND STYLED TEXT
class ButtonContainer extends StatelessWidget {
  /// CONSTRUCTOR THAT ACCEPTS THE TEXT TO DISPLAY ON THE BUTTON
  const ButtonContainer({super.key, required this.text});

  /// TEXT TO BE DISPLAYED ON THE BUTTON
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      /// SET THE WIDTH OF THE BUTTON TO MATCH THE SCREEN WIDTH
      width: MediaQuery.of(context).size.width,

      alignment: Alignment.center,

      height: 56,

      /// APPLY DECORATIONS LIKE BORDER AND BACKGROUND GRADIENT TO THE BUTTON
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.primaryLightColor),
        borderRadius: BorderRadius.circular(32),
        gradient: AppTheme.primaryGradient,
      ),

      /// DISPLAY THE PROVIDED TEXT WITH A STYLIZED THEME
      child: Text(
        text,
        style: AppTheme.lightTheme.textTheme.labelLarge,
      ),
    );
  }
}
