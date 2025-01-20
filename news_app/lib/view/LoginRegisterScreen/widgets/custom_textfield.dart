import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart';

/// CUSTOM TEXTFIELD WIDGET USED FOR REUSABLE TEXT INPUT FIELDS IN THE APP
class CustomTextfield extends StatelessWidget {
  /// CONSTRUCTOR REQUIRING PARAMETERS FOR CONTROLLER, VALIDATION FUNCTION, HINT TEXT, ICON, AND KEYBOARD TYPE
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.validate,
    required this.hintText,
    required this.icon,
    required this.keyboardType,
  });

  /// TEXT CONTROLLER TO MANAGE THE INPUT DATA
  final TextEditingController controller;

  /// VALIDATION FUNCTION FOR FORM FIELD VALIDATION
  final String? Function(String?) validate;

  /// HINT TEXT TO DISPLAY INSIDE THE TEXT FIELD
  final String hintText;

  /// ICON TO DISPLAY AT THE START OF THE TEXT FIELD
  final IconData icon;

  /// KEYBOARD TYPE TO SPECIFY THE INPUT TYPE (E.G., TEXT, NUMBER)
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(
          240, 241, 250, 0.4), // BACKGROUND COLOR FOR TEXT FIELD
      margin: const EdgeInsets.only(top: 20), // MARGIN ABOVE THE TEXT FIELD
      child: TextFormField(
        controller: controller, // ASSIGN THE CONTROLLER
        cursorColor: AppTheme.textColorLight, // CUSTOM CURSOR COLOR
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon, // ICON TO DISPLAY
            size: 26, // SIZE OF THE ICON
            color: AppTheme.textColor.withOpacity(0.4), // COLOR WITH OPACITY
          ),
          hintText: hintText, // SET HINT TEXT
          hintStyle: AppTheme
              .lightTheme.inputDecorationTheme.hintStyle, // HINT TEXT STYLE
          enabledBorder: AppTheme.lightTheme.inputDecorationTheme
              .enabledBorder, // BORDER WHEN ENABLED
          focusedBorder: AppTheme.lightTheme.inputDecorationTheme
              .focusedBorder, // BORDER WHEN FOCUSED
          errorBorder: AppTheme.lightTheme.inputDecorationTheme
              .errorBorder, // BORDER WHEN ERROR OCCURS
          focusedErrorBorder: AppTheme.lightTheme.inputDecorationTheme
              .focusedErrorBorder, // BORDER WHEN ERROR AND FOCUSED
        ),
        validator: validate, // VALIDATION FUNCTION
      ),
    );
  }
}
