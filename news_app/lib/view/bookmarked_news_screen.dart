import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart'; // IMPORT THE APP THEME
import 'package:news_app/controller/news_provider.dart'; // IMPORT THE NEWS PROVIDER FOR STATE MANAGEMENT
import 'package:news_app/view/details_screen.dart'; // IMPORT THE DETAILS SCREEN
import 'package:news_app/view/Widgets/button_container.dart'; // IMPORT THE CUSTOM BUTTON CONTAINER WIDGET
import 'package:provider/provider.dart'; // IMPORT PROVIDER FOR STATE MANAGEMENT
import 'dart:ui'; // IMPORT DART:UI FOR BACKDROP FILTER

/// THIS WIDGET REPRESENTS THE SCREEN THAT DISPLAYS BOOKMARKED NEWS ARTICLES
class BookmarkedNewsScreen extends StatelessWidget {
  /// CONSTRUCTOR FOR THE BOOKMARKED NEWS SCREEN
  const BookmarkedNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// ACCESS THE NEWS PROVIDER TO RETRIEVE BOOKMARKED NEWS
    final newsProvider = Provider.of<NewsProvider>(context);

    /// GET THE LIST OF BOOKMARKED NEWS ARTICLES FROM THE PROVIDER
    final bookmarkedNews = newsProvider.bookmarkedNews;

    return Scaffold(
      /// APPBAR TO DISPLAY THE SCREEN TITLE AND LOGO
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/logo.png", // DISPLAY THE LOGO IN THE APPBAR
          height: 20,
          width: 20,
        ),
        title: Text(
          'Bookmarked News',
          style: AppTheme.lightTheme.textTheme.titleLarge,
        ),
        automaticallyImplyLeading: false,
      ),

      /// BODY THAT DISPLAYS EITHER THE BOOKMARKED NEWS OR A MESSAGE IF EMPTY
      body: bookmarkedNews.isEmpty
          ? Center(
              /// SHOW MESSAGE WHEN NO NEWS IS BOOKMARKED
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.bookmark_outline, // ICON TO INDICATE BOOKMARK
                    size: 60,
                    color: AppTheme.textColorLight,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'No bookmarked news', // MESSAGE FOR EMPTY STATE
                    style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                      color: AppTheme.textColorLight,
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      /// NAVIGATE BACK TO THE PREVIOUS SCREEN
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const ButtonContainer(
                        text: 'Back to News', // TEXT FOR THE BUTTON
                      ),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              /// BUILD A LIST OF BOOKMARKED NEWS
              itemCount: bookmarkedNews.length,
              itemBuilder: (context, index) {
                /// GET THE CURRENT NEWS ITEM
                final news = bookmarkedNews[index];
                return GestureDetector(
                  /// NAVIGATE TO THE NEWS DETAILS SCREEN ON TAP
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            NewsDetailsScreen(detailNews: news),
                      ),
                    );
                  },
                  child: Card(
                    /// STYLING THE CARD
                    margin: const EdgeInsets.all(10),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        /// DISPLAY THE NEWS IMAGE
                        Image.network(
                          news.urlToImage!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                        Positioned.fill(
                          /// APPLY A BLUR EFFECT OVER THE IMAGE
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                            child: Container(
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ),
                        ),
                        Positioned(
                          /// OVERLAY GRADIENT AND TEXT ON THE IMAGE
                          top: 10,
                          bottom: 0,
                          right: 1,
                          left: 1,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.6), // DARKER COLOR
                                  Colors.transparent, // LIGHTER COLOR
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            child: Column(
                              /// DISPLAY THE TITLE AND META INFORMATION
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /// DISPLAY THE NEWS TITLE
                                Text(
                                  news.title!,
                                  style: AppTheme
                                      .lightTheme.textTheme.titleLarge
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontSize: 16), // APPLY THEME STYLE
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      /// DISPLAY THE NEWS AUTHOR
                                      child: Text(
                                        news.author!,
                                        style: AppTheme
                                            .lightTheme.textTheme.titleMedium
                                            ?.copyWith(
                                                color: Colors.white70,
                                                fontSize:
                                                    14), // APPLY THEME STYLE
                                      ),
                                    ),

                                    /// DISPLAY THE PUBLISHED DATE
                                    Text(
                                      news.publishedAt!,
                                      style: AppTheme
                                          .lightTheme.textTheme.titleMedium
                                          ?.copyWith(
                                              color: Colors.white70,
                                              fontSize:
                                                  14), // APPLY THEME STYLE
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
