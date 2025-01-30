import 'package:flutter/material.dart';
import 'package:news_app/controller/login_register_provider.dart';
import 'package:news_app/controller/session_data.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loginRegisterProvider = Provider.of<LoginRegisterProvider>(context);

    return Drawer(
      backgroundColor: Colors.white,
      width: 250,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                gradient:
                    AppTheme.primaryGradient // Background color for the header
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "News App",
                  style: AppTheme.lightTheme.textTheme.titleLarge!
                      .copyWith(color: Colors.white, fontSize: 25),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        backgroundColor: AppTheme.iconColor,
                        child: Icon(
                          Icons.person,
                          color: AppTheme.primaryLightColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            SessionData.username,
                            style: AppTheme.lightTheme.textTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.w800),
                          ),
                          Text(
                            SessionData.email,
                            style: AppTheme.lightTheme.textTheme.bodySmall!
                                .copyWith(color: AppTheme.iconColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title:
                Text("Home", style: AppTheme.lightTheme.textTheme.titleMedium),
            onTap: () {
              /// NAVIGATE TO HOME SCREEN
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark_outline),
            title: Text("Bookmarked News",
                style: AppTheme.lightTheme.textTheme.titleMedium),
            onTap: () {
              /// NAVIGATE TO BOOKMARKED NEWS SCREEN
              Navigator.of(context).pushNamed('/bookmarked');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text("Logout",
                style: AppTheme.lightTheme.textTheme.titleMedium),
            onTap: () {
              /// HANDLE LOGOUT FUNCTIONALITY
              loginRegisterProvider.logOutUserOfNewsAppFromFirebase();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login', (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
