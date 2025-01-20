import 'package:flutter/material.dart';
import 'package:news_app/view/bookmarked_news_screen.dart';

import 'package:news_app/view/HomeScreen/home.dart';
import 'package:news_app/view/LoginRegisterScreen/signup.dart';
import 'package:news_app/view/splash_screen.dart';

import '../LoginRegisterScreen/login_screen.dart';

Widget initialScreen = const SplashScreen();
Map<String, Widget Function(BuildContext)> appRoutes = {
  "/signup": (context) => const SignUpScreen(),
  "/login": (context) => const LoginScreen(),
  "/home": (context) => const HomeScreen(),
  '/bookmarked': (context) => const BookmarkedNewsScreen(),
};
