import 'package:flutter/material.dart';
import 'package:news_app/model/newsmodel.dart'; // IMPORT THE NEWS MODEL
import 'package:url_launcher/url_launcher_string.dart'; // IMPORT URL LAUNCHER FOR OPENING LINKS
import 'package:news_app/theme/app_theme.dart'; // IMPORT THE THEME FILE

/// SCREEN TO DISPLAY DETAILED INFORMATION ABOUT A NEWS ARTICLE
class NewsDetailsScreen extends StatefulWidget {
  /// CONSTRUCTOR ACCEPTS THE ARTICLE DETAILS AS A PARAMETER
  const NewsDetailsScreen({super.key, required this.detailNews});

  /// THE NEWS ARTICLE TO DISPLAY
  final Article detailNews;

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// BODY CONTAINS A SCROLLABLE VIEW FOR DISPLAYING NEWS DETAILS
      body: SingleChildScrollView(
        child: Stack(
          children: [
            /// DISPLAY THE NEWS IMAGE AS A BACKGROUND
            Image.network(
              widget.detailNews.urlToImage!,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
            ),

            /// DISPLAY THE CONTENT IN A CONTAINER BELOW THE IMAGE
            Padding(
              padding: const EdgeInsets.only(top: 350),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 2,
                width: MediaQuery.of(context).size.width,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0), // ROUNDED CORNERS
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// DISPLAY THE NEWS TITLE
                        Text(
                          widget.detailNews.title!,
                          style: AppTheme.lightTheme.textTheme.titleLarge
                              ?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(height: 20),

                        /// DISPLAY THE PUBLISHED DATE IN A CHIP
                        Chip(
                          backgroundColor:
                              const Color.fromRGBO(242, 242, 242, 1),
                          label: Text(
                            widget.detailNews.publishedAt!,
                            style: AppTheme.lightTheme.textTheme.bodyMedium
                                ?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        /// DISPLAY THE NEWS DESCRIPTION
                        Text(
                          widget.detailNews.description!,
                          style:
                              AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),

                        /// DISPLAY THE AUTHOR NAME IN A CHIP
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Chip(
                            backgroundColor:
                                const Color.fromRGBO(242, 242, 242, 1),
                            label: Text(
                              "Author : ${widget.detailNews.author}",
                              style: AppTheme.lightTheme.textTheme.bodyMedium
                                  ?.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),

                        /// CARD TO DISPLAY THE NEWS SOURCE IMAGE
                        Card(
                          clipBehavior: Clip.antiAlias,
                          margin: const EdgeInsets.all(10),
                          elevation: 15, // ADD SHADOW TO THE CARD
                          color: Colors.black12, // BACKGROUND COLOR
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              /// ON TAP, OPEN THE NEWS URL
                              InkWell(
                                onTap: () async {
                                  if (await canLaunchUrlString(
                                      widget.detailNews.url!)) {
                                    await launchUrlString(
                                        widget.detailNews.url!,
                                        mode: LaunchMode.inAppWebView);
                                  }
                                },
                                child: Image.network(
                                  widget.detailNews.urlToImage!,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              Positioned(
                                bottom: 10,

                                /// DISPLAY "NEWS SOURCE" TEXT OVER THE IMAGE
                                child: Text(
                                  "News Source",
                                  style: AppTheme
                                      .lightTheme.textTheme.titleMedium
                                      ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
