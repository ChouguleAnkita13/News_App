import 'package:flutter/material.dart';
import 'package:news_app/controller/news_provider.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

class PasswordTextfield extends StatelessWidget {
  const PasswordTextfield({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    return Container(
      color: const Color.fromRGBO(240, 241, 250, 0.4),
      margin: const EdgeInsets.only(top: 20, bottom: 5),
      child: TextFormField(
        controller: controller,
        cursorColor: AppTheme.textColorLight,
        obscureText: newsProvider.isPasswordVisible,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock_outline_rounded,
            size: 26,
            color: AppTheme.textColor.withOpacity(0.4),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
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
          hintText: "  Enter your password",
          hintStyle: AppTheme.lightTheme.inputDecorationTheme.hintStyle,
          enabledBorder: AppTheme.lightTheme.inputDecorationTheme.enabledBorder,
          focusedBorder: AppTheme.lightTheme.inputDecorationTheme.focusedBorder,
          errorBorder: AppTheme.lightTheme.inputDecorationTheme.errorBorder,
          focusedErrorBorder:
              AppTheme.lightTheme.inputDecorationTheme.focusedErrorBorder,
        ),
        validator: (value) {
          if (value!.trim().isEmpty) {
            return "Please Enter Password";
          }

          if (!RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+={}|;\<>?,.\/~`\-\\[\]]).{8,}$')
              .hasMatch(value)) {
            return 'Please enter password with one uppercase letter, one lowercase letter, one digit, and one special character ';
          }
          return null;
        },
      ),
    );
  }
}
