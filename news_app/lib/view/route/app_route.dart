import 'package:flutter/material.dart';
import 'package:news_app/view/bookmarked_news_screen.dart';
import 'package:news_app/view/HomeScreen/home.dart';
import 'package:news_app/view/LoginRegisterScreen/signup.dart';
import 'package:news_app/view/splash_screen.dart';
import '../LoginRegisterScreen/login_screen.dart';

/// DEFINE THE INITIAL SCREEN THAT WILL BE DISPLAYED WHEN THE APP STARTS
Widget initialScreen = const SplashScreen();

/// DEFINE ROUTES FOR NAVIGATING THROUGH THE APP SCREENS
Map<String, Widget Function(BuildContext)> appRoutes = {
  /// ROUTE FOR SIGN-UP SCREEN
  "/signup": (context) => const SignUpScreen(),

  /// ROUTE FOR LOGIN SCREEN
  "/login": (context) => const LoginScreen(),

  /// ROUTE FOR HOME SCREEN
  "/home": (context) => const HomeScreen(),

  /// ROUTE FOR BOOKMARKED NEWS SCREEN
  '/bookmarked': (context) => const BookmarkedNewsScreen(),
};
