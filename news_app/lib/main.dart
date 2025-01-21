import 'package:flutter/material.dart';
import 'package:news_app/view/route/app_route.dart'; // IMPORT APP ROUTES
import 'package:news_app/controller/news_provider.dart'; // IMPORT NEWS PROVIDER FOR STATE MANAGEMENT
import 'package:provider/provider.dart'; // IMPORT PROVIDER PACKAGE FOR STATE MANAGEMENT
import 'package:news_app/theme/app_theme.dart'; // IMPORT APP THEME

/// MAIN ENTRY POINT OF THE APPLICATION
void main() {
  runApp(const MyApp()); // RUN THE APPLICATION
}

/// ROOT WIDGET OF THE APPLICATION
class MyApp extends StatelessWidget {
  /// CONSTRUCTOR FOR MyApp
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// WRAPPING THE APPLICATION IN A ChangeNotifierProvider TO PROVIDE NewsProvider
    return ChangeNotifierProvider(
      /// INITIALIZE NewsProvider FOR THE ENTIRE APP
      create: (context) => NewsProvider(),
      child: MaterialApp(
        /// SET THE INITIAL SCREEN OF THE APPLICATION
        home: initialScreen,

        /// DEFINE NAMED ROUTES FOR NAVIGATION
        routes: appRoutes,

        /// APPLY THE CUSTOM APP THEME
        theme: AppTheme.lightTheme,

        /// DISABLE THE DEBUG BANNER IN THE APP
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
