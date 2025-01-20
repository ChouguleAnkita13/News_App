import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.primaryLightColor),
        borderRadius: BorderRadius.circular(32),
        gradient: AppTheme.primaryGradient,
      ),
      child: Text(
        text,
        style: AppTheme.lightTheme.textTheme.labelLarge,
      ),
    );
  }
}
