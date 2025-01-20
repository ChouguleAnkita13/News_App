import 'package:flutter/material.dart';
import 'package:news_app/view/route/app_route.dart'; // Import app routes
import 'package:news_app/controller/news_provider.dart';
import 'package:provider/provider.dart';
import 'package:news_app/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Use ChangeNotifierProvider to provide NewsProvider to the entire app
      create: (context) => NewsProvider(),
      child: MaterialApp(
        home: initialScreen,
        routes: appRoutes,
        theme: AppTheme.lightTheme, // Apply the theme
        debugShowCheckedModeBanner: false, // Disable the debug banner
      ),
    );
  }
}
