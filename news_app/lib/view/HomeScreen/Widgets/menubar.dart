import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:news_app/controller/news_provider.dart';
import 'package:news_app/view/HomeScreen/Widgets/news.dart';

/// CATEGORY MENU BAR WIDGET REPRESENTING CATEGORY SELECTION AND NEWS DISPLAY
class CategoryMenuBar extends StatelessWidget {
  const CategoryMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, newsProvider, child) {
        return Column(
          children: [
            Row(
              children: [
                DropdownButton(
                    value: newsProvider.selectCountry,
                    items: newsProvider.countryList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      newsProvider.getselectedCountry(value!);
                    }),

                /// HORIZONTAL SCROLLABLE LIST OF CATEGORIES

                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: newsProvider.categories.map((category) {
                        return GestureDetector(
                          onTap: () {
                            /// SET THE SELECTED CATEGORY IN THE NEWSPROVIDER WHEN A CATEGORY IS TAPPED
                            newsProvider.setSelectedCategory(category);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: newsProvider.selectedCategory == category
                                    ? const Color.fromRGBO(255, 179, 182, 1)
                                    : const Color.fromRGBO(240, 241, 250, 1),
                              ),
                              gradient:
                                  newsProvider.selectedCategory == category
                                      ? const LinearGradient(
                                          colors: [
                                            Color.fromRGBO(255, 128, 134, 1),
                                            Color.fromRGBO(255, 58, 68, 1),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        )
                                      : const LinearGradient(
                                          colors: [
                                            Color.fromRGBO(255, 255, 255, 1),
                                            Color.fromRGBO(255, 255, 255, 1),
                                          ],
                                        ),
                            ),
                            child: Text(
                              category,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: newsProvider.selectedCategory == category
                                    ? const Color.fromRGBO(255, 255, 255, 1)
                                    : const Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),

            /// SHOW A LOADING INDICATOR IF DATA IS STILL LOADING, OTHERWISE SHOW THE NEWS WIDGET
            newsProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : const News()
          ],
        );
      },
    );
  }
}
