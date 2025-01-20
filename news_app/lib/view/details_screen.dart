import 'package:flutter/material.dart';
import 'package:news_app/model/newsmodel.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:news_app/theme/app_theme.dart'; // Import the theme file

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({super.key, required this.detailNews});

  final Article detailNews;

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.network(
              widget.detailNews.urlToImage!,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 2,
                width: MediaQuery.of(context).size.width,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.detailNews.title!,
                          style: AppTheme.lightTheme.textTheme.titleLarge
                              ?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          widget.detailNews.description!,
                          style:
                              AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                        const SizedBox(
                          height: 25,
                        ),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          margin: const EdgeInsets.all(10),
                          elevation: 15,
                          color: Colors.black12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
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
