import 'package:flutter/material.dart';
import 'package:news_app/view/HomeScreen/Widgets/menubar.dart';
import 'package:news_app/theme/app_theme.dart'; // IMPORT THE THEME FILE

/// HOME SCREEN WIDGET REPRESENTING THE MAIN VIEW OF THE APP
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// APP BAR CONFIGURATION
      appBar: AppBar(
        /// LEADING LOGO IMAGE
        leading: Image.asset(
          "assets/images/logo.png",
          height: 45,
          width: 45,
        ),

        /// APP TITLE WITH THEMED TEXT STYLE
        title: Text(
          "inshorts",
          style: AppTheme
              .lightTheme.textTheme.titleLarge, // USE THE THEMED TEXT STYLE
        ),

        /// ACTION BUTTONS IN THE APP BAR
        actions: [
          Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.only(right: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: AppTheme.primaryGradient, // USE THE THEMED GRADIENT
            ),

            /// BOOKMARK ICON WITH NAVIGATION TO BOOKMARKED NEWS SCREEN
            child: GestureDetector(
              child: const Icon(
                Icons.bookmark_outline,
                color: AppTheme.iconColor, // USE THE THEMED ICON COLOR
              ),
              onTap: () {
                /// NAVIGATE TO BOOKMARKED NEWS SCREEN
                Navigator.of(context).pushNamed('/bookmarked');
              },
            ),
          ),
        ],
      ),

      /// BODY CONTENT WITH CATEGORY MENU BAR
      body: const Padding(
        padding: EdgeInsets.only(top: 20, left: 8, right: 8),
        child: CategoryMenuBar(),
      ),
    );
  }
}
