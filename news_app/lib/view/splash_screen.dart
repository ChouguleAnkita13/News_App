import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/controller/session_data.dart';
import 'package:news_app/theme/app_theme.dart'; // IMPORT THE THEME FILE

/// SPLASH SCREEN THAT DISPLAYS A LOADING SCREEN FOR A FEW SECONDS
/// BEFORE NAVIGATING TO THE LOGIN SCREEN
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// DELAY FOR 3 SECONDS AND THEN EXECUTE THE NAVIGATION LOGIC
    Future.delayed(const Duration(seconds: 3), () async {
      /// RETRIEVE SESSION DATA FROM SHARED PREFERENCES
      await SessionData.getSessionData();
      log(SessionData.isLogin.toString()); // LOG THE LOGIN STATUS FOR DEBUGGING

      /// CHECK IF THE USER IS ALREADY LOGGED IN USING THE SESSION DATA
      /// IF LOGGED IN, NAVIGATE TO THE HOME SCREEN
      if (SessionData.isLogin!) {
        Navigator.of(context).pushReplacementNamed("/home");
      } else {
        /// IF NOT LOGGED IN, NAVIGATE TO THE LOGIN SCREEN
        Navigator.of(context).pushReplacementNamed("/login");
      }
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
