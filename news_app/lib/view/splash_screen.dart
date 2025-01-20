import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart'; // Import the theme file

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the login screen
      Navigator.of(context).pushReplacementNamed("/login");
    });

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/splash.png",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          // Positioned text widget for the app name
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            child: Text(
              "inshorts",
              style: AppTheme.lightTheme.textTheme.displayLarge?.copyWith(
                color: Colors.white,
                fontSize: 64
              ),
            ),
          ),
        ],
      ),
    );
  }
}
