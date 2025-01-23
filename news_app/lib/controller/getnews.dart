import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:news_app/model/newsmodel.dart';

/// FUNCTION TO FETCH NEWS DATA FROM THE API BASED ON THE SPECIFIED CATEGORY
Future<List<Article>> getNews(String category, String selectCountry) async {
  try {
    /// BUILD THE API URL WITH CATEGORY AND API KEY
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$selectCountry&category=$category&apiKey=2dad900c83e649f1974a0d8fbc2c41c4");

    /// MAKE AN HTTP GET REQUEST TO THE API
    http.Response response = await http.get(url);

    /// CHECK IF THE RESPONSE STATUS IS 200 (SUCCESS)
    if (response.statusCode == 200) {
      /// DECODE THE RESPONSE BODY INTO A MAP
      Map<String, dynamic> responseData = json.decode(response.body);

      /// CREATE A NEW INSTANCE OF NEWSMODEL FROM THE RESPONSE DATA
      NewsModel newsModel = NewsModel(responseData);

      /// LOG THE TOTAL RESULTS COUNT
      log("${newsModel.totalResults}");

      /// RETURN THE LIST OF ARTICLES OR AN EMPTY LIST IF NULL
      return newsModel.articles ?? [];
    } else {
      /// LOG AN ERROR MESSAGE IF THE STATUS CODE IS NOT 200
      log("Failed to load news: ${response.statusCode}");
      return [];
    }
  } catch (e) {
    /// HANDLE ANY EXCEPTIONS THAT OCCUR DURING THE REQUEST OR PARSING
    log("An error occurred: $e");
    return [];
  }
}
