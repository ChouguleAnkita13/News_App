import 'package:flutter/material.dart';
import 'package:news_app/controller/news_provider.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

/// CUSTOM WIDGET FOR PASSWORD INPUT FIELD
class PasswordTextfield extends StatelessWidget {
  /// CONTROLLER TO MANAGE THE INPUT TEXT
  const PasswordTextfield({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(

        /// ACCESS THE NEWS PROVIDER INSTANCE
        builder: (context, newsProvider, child) {
      return Container(
        /// APPLYING BACKGROUND COLOR AND MARGIN TO THE TEXT FIELD CONTAINER
        color: const Color.fromRGBO(240, 241, 250, 0.4),
        margin: const EdgeInsets.only(top: 20, bottom: 5),
        child: TextFormField(
          /// CONTROLLER TO MANAGE TEXT INPUT
          controller: controller,

          /// SET THE CURSOR COLOR
          cursorColor: AppTheme.textColorLight,

          /// ENABLE OBSCURE TEXT FOR PASSWORD INPUT
          obscureText: newsProvider.isPasswordVisible,
          obscuringCharacter: "*",

          /// DECORATION FOR THE INPUT FIELD
          decoration: InputDecoration(
            /// PREFIX ICON FOR PASSWORD FIELD
            prefixIcon: Icon(
              Icons.lock_outline_rounded,
              size: 26,
              color: AppTheme.textColor.withOpacity(0.4),
            ),

            /// SUFFIX ICON TO TOGGLE PASSWORD VISIBILITY
            suffixIcon: GestureDetector(
              onTap: () {
                /// TOGGLE PASSWORD VISIBILITY ON TAP
                newsProvider.togglePassword();
              },
              child: Icon(
                newsProvider.isPasswordVisible
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: 26,
                color: AppTheme.textColor.withOpacity(0.4),
              ),
            ),

            /// HINT TEXT FOR THE INPUT FIELD
            hintText: "  Enter your password",
            hintStyle: AppTheme.lightTheme.inputDecorationTheme.hintStyle,

            /// STYLING FOR ENABLED, FOCUSED, AND ERROR STATES OF THE INPUT FIELD
            enabledBorder:
                AppTheme.lightTheme.inputDecorationTheme.enabledBorder,
            focusedBorder:
                AppTheme.lightTheme.inputDecorationTheme.focusedBorder,
            errorBorder: AppTheme.lightTheme.inputDecorationTheme.errorBorder,
            focusedErrorBorder:
                AppTheme.lightTheme.inputDecorationTheme.focusedErrorBorder,
          ),

          /// VALIDATOR TO VALIDATE PASSWORD INPUT
          validator: (value) {
            /// CHECK IF PASSWORD FIELD IS EMPTY
            if (value!.trim().isEmpty) {
              return "Please Enter Password";
            }

            /// REGEX VALIDATION FOR STRONG PASSWORD REQUIREMENTS
            if (!RegExp(
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+={}|;<>?,.\/~`\-\\[\]]).{8,}$')
                .hasMatch(value)) {
              return 'Please enter password with one uppercase letter, one lowercase letter, one digit, and one special character';
            }
            return null;
          },
        ),
      );
    });
  }
}
