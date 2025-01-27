import 'package:intl/intl.dart';

// MODEL CLASS REPRESENTING THE STRUCTURE OF NEWS DATA
class NewsModel {
  /// STATUS OF THE NEWS RESPONSE
  String? status;

  /// TOTAL NUMBER OF RESULTS AVAILABLE
  int? totalResults;

  /// LIST OF ARTICLES INCLUDED IN THE RESPONSE
  List<Article>? articles;

  /// CONSTRUCTOR TO INITIALIZE NEWSMODEL FROM JSON DATA
  NewsModel(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    articles = [];

    /// ITERATE THROUGH ARTICLES AND ADD ONLY IF URLTOIMAGE IS NOT NULL
    if (json['articles'] != null) {
      json['articles'].forEach((article) {
        if (article['urlToImage'] != null) {
          articles!.add(Article.fromJson(article));
        }
      });
    }
  }
}

// MODEL CLASS REPRESENTING INDIVIDUAL ARTICLE DATA
class Article {
  ///
  String? dateId;

  /// AUTHOR OF THE ARTICLE (DEFAULT TO "SABINNA PIERRE" IF NULL)
  String? author;

  /// TITLE OF THE ARTICLE
  String? title;

  /// DESCRIPTION OF THE ARTICLE
  String? description;

  /// URL OF THE ARTICLE
  String? url;

  /// IMAGE URL OF THE ARTICLE
  String? urlToImage;

  /// PUBLISHED DATE OF THE ARTICLE
  String? publishedAt;

  /// CONTENT OF THE ARTICLE
  String? content;

  // ///CONSTRUCTOR TO INITIALIZE VARIABLES
  Article({
    required this.dateId,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  ///NAMED CONSTRUCTOR TO INITIALIZE ARTICLE FROM JSON DATA
  Article.fromJson(Map<String, dynamic> json) {
    dateId = json['publishedAt'];
    author = json['author'] ?? "Sabinna Pierre";
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = DateFormat('EEEE, dd MMM yyyy')
        .format(DateTime.parse(json['publishedAt']));
    content = json['content'];
  }

  Map<String, dynamic> articleMap() {
    return {
      "dateId": dateId,
      "author": author,
      "title": title,
      "description": description,
      "url": url,
      "urlToImage": urlToImage,
      "publishedAt": publishedAt,
      "content": content
    };
  }
}
