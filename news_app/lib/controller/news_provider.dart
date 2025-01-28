import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news_app/controller/firebase_data.dart';
import 'package:news_app/controller/getnews.dart';
import 'package:news_app/model/newsmodel.dart';

/// PROVIDER CLASS TO MANAGE NEWS DATA AND USER INTERACTIONS
class NewsProvider with ChangeNotifier {
  final FirebaseData firebaseData = FirebaseData();

  /// CONSTRUCTOR TO FETCH NEWS DATA FOR THE "NATIONAL" CATEGORY WHEN THE PROVIDER IS INITIALIZED
  NewsProvider() {
    getAllNews();
    getAllBookMarkedNews();
  }

  /// PRIVATE VARIABLE TO STORE THE SELECTED CATEGORY
  String _selectedCategory = 'Business';

  /// PRIVATE VARIABLE TO STORE THE SELECTED COUNTRY
  String _selectedCountry = "us";

  /// PRIVATE VARIABLE TO STORE FETCHED NEWS DATA
  List<Article> _newsData = [];

  /// PRIVATE VARIABLE TO STORE BOOKMARKED ARTICLES
  final List<Article> _bookmarkedNews = [];

  /// PRIVATE VARIABLE TO TRACK LOADING STATE
  bool _isLoading = false;

  /// LIST OF CATEGORIES AVAILABLE FOR SELECTION
  List<String> categories = [
    'Business',
    'Sports',
    'Politics',
    'Technology',
    'Entertainment',
    'Science',
    'Automobile',
  ];

  /// LIST OF COUNTRIES AVAILABLE FOR SELECTION
  List<String> countryList = ["us", "in"];

  /// GETTER TO ACCESS THE SELECTED CATEGORY
  String get selectedCategory => _selectedCategory;

  /// GETTER TO ACCESS THE SELECTED COUNTRY
  String get selectCountry => _selectedCountry;

  /// GETTER TO ACCESS THE FETCHED NEWS DATA
  List<Article> get newsData => _newsData;

  /// GETTER TO ACCESS THE BOOKMARKED ARTICLES
  List<Article> get bookmarkedNews => _bookmarkedNews;

  /// GETTER TO ACCESS THE LOADING STATE
  bool get isLoading => _isLoading;

  /// METHOD TO SET THE SELECTED CATEGORY AND FETCH NEWS DATA ACCORDINGLY
  void setSelectedCategory(String category) {
    _selectedCategory = category;
    getAllNews();
  }

  /// METHOD TO SET THE SELECTED COUNTRY AND FETCH NEWS DATA ACCORDINGLY

  void getselectedCountry(String country) {
    _selectedCountry = country;
    getAllNews();
  }

  /// ASYNCHRONOUS METHOD TO FETCH NEWS DATA BASED ON THE SELECTED CATEGORY
  Future<void> getAllNews() async {
    _isLoading = true;
    notifyListeners();

    try {
      /// FETCH NEWS DATA USING THE SELECTED CATEGORY
      _newsData =
          await getNews(_selectedCategory.toLowerCase(), _selectedCountry);
    } catch (e) {
      /// LOG AN ERROR MESSAGE IF FETCHING NEWS FAILS
      log('Error fetching news: $e');
    } finally {
      /// RESET THE LOADING STATE AND NOTIFY LISTENERS
      _isLoading = false;
      notifyListeners();
    }
  }

  ///
  Future<void> getAllBookMarkedNews() async {
    _bookmarkedNews.clear();
    List bookmarkedNews = await firebaseData.getBookMarkedNewsFromFirebase();
    for (var data in bookmarkedNews) {
      _bookmarkedNews.add(data);
    }
    notifyListeners();
  }

  /// METHOD TO TOGGLE THE BOOKMARK STATUS OF AN ARTICLE
  void toggleBookmark(Article article) async {
    await firebaseData.addAndRemoveBookmarkedNewsToFirebase(article);
    await getAllBookMarkedNews();
    notifyListeners();
  }

  // /// METHOD TO CHECK IF AN ARTICLE IS BOOKMARKED
  bool isBookmarked(Article article) {
    // firebaseData.getBookMarkedNewsFromFirebase();
    return firebaseData.bookmarkedNewsIds.contains(article.dateId);
  }
}
