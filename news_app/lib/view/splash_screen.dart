import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart'; // IMPORT THE THEME FILE

/// SPLASH SCREEN THAT DISPLAYS A LOADING SCREEN FOR A FEW SECONDS
/// BEFORE NAVIGATING TO THE LOGIN SCREEN
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// DELAY FOR 3 SECONDS AND THEN NAVIGATE TO THE LOGIN SCREEN
    Future.delayed(const Duration(seconds: 3), () {
      // NAVIGATE TO THE LOGIN SCREEN USING NAMED ROUTE
      Navigator.of(context).pushReplacementNamed("/login");
    });

    return Scaffold(
      body: Stack(
        alignment: Alignment.center, // CENTER ALIGN ALL CHILDREN IN THE STACK
        children: [
          /// BACKGROUND IMAGE THAT COVERS THE ENTIRE SCREEN
          Image.asset(
            "assets/images/splash.png",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),

          /// POSITIONED TEXT WIDGET TO DISPLAY THE APP NAME
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            child: Text(
              "inshorts",
              style: AppTheme.lightTheme.textTheme.displayLarge?.copyWith(
                color: Colors.white,
                fontSize: 64,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
