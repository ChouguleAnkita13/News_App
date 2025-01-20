import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news_app/controller/getnews.dart';
import 'package:news_app/model/newsmodel.dart';

/// PROVIDER CLASS TO MANAGE NEWS DATA AND USER INTERACTIONS
class NewsProvider with ChangeNotifier {
  /// PRIVATE VARIABLE TO STORE THE SELECTED CATEGORY
  String _selectedCategory = 'Business';

  /// PRIVATE VARIABLE TO STORE FETCHED NEWS DATA
  List<Article> _newsData = [];

  /// PRIVATE VARIABLE TO STORE BOOKMARKED ARTICLES
  final List<Article> _bookmarkedNews = [];

  /// PRIVATE VARIABLE TO TRACK LOADING STATE
  bool _isLoading = false;

  /// PRIVATE VARIABLE TO SHOW PASSWORD VISIBILTY
  bool _isPasswordVisible = true;

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

  /// CONSTRUCTOR TO FETCH NEWS DATA FOR THE "NATIONAL" CATEGORY WHEN THE PROVIDER IS INITIALIZED
  NewsProvider() {
    getAllNews();
  }

  /// GETTER TO ACCESS THE SELECTED CATEGORY
  String get selectedCategory => _selectedCategory;

  /// GETTER TO ACCESS THE FETCHED NEWS DATA
  List<Article> get newsData => _newsData;

  /// GETTER TO ACCESS THE BOOKMARKED ARTICLES
  List<Article> get bookmarkedNews => _bookmarkedNews;

  /// GETTER TO ACCESS THE LOADING STATE
  bool get isLoading => _isLoading;

  /// GETTER TO ACCESS THE PASSWORD VISIBILTY STATUS
  bool get isPasswordVisible => _isPasswordVisible;

  /// METHOD TO TOGGLE THE PASSWORD VISIBILTY STATUS
  void togglePassword() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();

    ///NOTIFIES LISTENERS WHEN THE PASSWORD VISIBILTY STATUS CHANGES
  }

  /// METHOD TO SET THE SELECTED CATEGORY AND FETCH NEWS DATA ACCORDINGLY
  void setSelectedCategory(String category) {
    _selectedCategory = category;
    getAllNews();
  }

  /// ASYNCHRONOUS METHOD TO FETCH NEWS DATA BASED ON THE SELECTED CATEGORY
  Future<void> getAllNews() async {
    _isLoading = true;
    notifyListeners();

    try {
      /// FETCH NEWS DATA USING THE SELECTED CATEGORY
      _newsData = await getNews(_selectedCategory.toLowerCase());
    } catch (e) {
      /// LOG AN ERROR MESSAGE IF FETCHING NEWS FAILS
      log('Error fetching news: $e');
    } finally {
      /// RESET THE LOADING STATE AND NOTIFY LISTENERS
      _isLoading = false;
      notifyListeners();
    }
  }

  /// METHOD TO TOGGLE THE BOOKMARK STATUS OF AN ARTICLE
  void toggleBookmark(Article article) {
    if (_bookmarkedNews.contains(article)) {
      /// REMOVE THE ARTICLE FROM THE BOOKMARK LIST IF IT ALREADY EXISTS
      _bookmarkedNews.remove(article);
    } else {
      /// ADD THE ARTICLE TO THE BOOKMARK LIST IF IT DOES NOT EXIST
      _bookmarkedNews.add(article);
    }
    notifyListeners();
  }

  /// METHOD TO CHECK IF AN ARTICLE IS BOOKMARKED
  bool isBookmarked(Article article) {
    return _bookmarkedNews.contains(article);
  }
}
