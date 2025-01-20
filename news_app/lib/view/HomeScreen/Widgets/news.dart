import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:news_app/view/details_screen.dart';
import 'package:provider/provider.dart';
import 'package:news_app/controller/news_provider.dart';

/// NEWS WIDGET DISPLAYING A LIST OF ARTICLES IN A PAGEVIEW
class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, newsProvider, child) {
        return Container(
          /// SET THE HEIGHT OF THE CONTAINER BASED ON SCREEN SIZE
          height: MediaQuery.of(context).size.height / 1.44,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(242, 242, 242, 1),
          ),
          child: PageView.builder(
            /// NUMBER OF ITEMS IN THE PAGEVIEW IS DETERMINED BY THE LENGTH OF NEWSDATA LIST IN NEWSPROVIDER
            itemCount: newsProvider.newsData.length,
            itemBuilder: (context, pageIndex) {
              /// GET THE ARTICLE AT THE CURRENT INDEX
              final article = newsProvider.newsData[pageIndex];
              return GestureDetector(
                onTap: () {
                  /// NAVIGATE TO NEWS DETAILS SCREEN WHEN AN ARTICLE IS TAPPED
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewsDetailsScreen(
                      detailNews: article,
                    ),
                  ));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /// DISPLAY THE ARTICLE IMAGE WITH NETWORK IMAGE
                    Image.network(
                      article.urlToImage!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2.45,
                    ),
                    const SizedBox(height: 30),

                    /// DISPLAY THE TITLE OF THE ARTICLE
                    Expanded(
                      child: Text(
                        article.title!,
                        style: AppTheme.lightTheme.textTheme.titleLarge
                            ?.copyWith(fontSize: 18, color: AppTheme.textColor),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    /// DISPLAY THE DATE AND BOOKMARK ICON OF THE ARTICLE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          article.publishedAt!,
                          style: AppTheme.lightTheme.textTheme.titleMedium
                              ?.copyWith(
                            fontSize: 13,
                          ),
                        ),

                        /// DISPLAY BOOKMARK ICON, TOGGLE THE BOOKMARK STATUS WHEN TAPPED
                        IconButton(
                          onPressed: () {
                            newsProvider.toggleBookmark(article);
                          },
                          icon: Icon(
                            newsProvider.isBookmarked(article)
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            size: 24,
                            color: newsProvider.isBookmarked(article)
                                ? const Color.fromRGBO(34, 31, 31, 1)
                                : const Color.fromRGBO(34, 31, 31, 0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
