import 'package:flutter/material.dart';
import 'package:news_app/controller/login_register_provider.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

/// CUSTOM WIDGET FOR PASSWORD INPUT FIELD
class PasswordTextfield extends StatelessWidget {
  const PasswordTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginRegisterProvider>(

        /// ACCESS THE NEWS PROVIDER INSTANCE
        builder: (context, loginRegisterProvider, child) {
      return Container(
        /// APPLYING BACKGROUND COLOR AND MARGIN TO THE TEXT FIELD CONTAINER
        color: const Color.fromRGBO(240, 241, 250, 0.4),
        margin: const EdgeInsets.only(top: 20, bottom: 5),
        child: TextFormField(
          /// CONTROLLER TO MANAGE TEXT INPUT
          controller: loginRegisterProvider.passwordController,

          /// SET THE CURSOR COLOR
          cursorColor: AppTheme.textColorLight,

          /// ENABLE OBSCURE TEXT FOR PASSWORD INPUT
          obscureText: loginRegisterProvider.isPasswordVisible,
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
                loginRegisterProvider.togglePassword();
              },
              child: Icon(
                loginRegisterProvider.isPasswordVisible
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
        ),
      );
    });
  }
}
