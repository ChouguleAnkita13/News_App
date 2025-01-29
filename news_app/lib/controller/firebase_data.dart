import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/model/newsmodel.dart';

class FirebaseData {
  /// INSTANCE OF FIREBASE FIRESTORE
  final FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;

  /// INSTANCE OF FIREBASE AUTHENTICATION
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  /// LIST TO STORE BOOKMARKED NEWS IDS
  List bookmarkedNewsIds = [];

  /// SIGN UP A NEW USER WITH EMAIL AND PASSWORD
  Future<String> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      /// CREATE A USER ACCOUNT IN FIREBASE AUTH
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      /// STORE USER DATA IN FIRESTORE DATABASE
      await firebaseInstance.collection("Users").doc(email).set({
        "username": name,
        "Phone": phone,
        "email": email,
        "password": password,
        "bookmarkedNews": [],
      });
      return ""; // RETURN EMPTY STRING IF SUCCESSFUL
    } on FirebaseAuthException catch (error) {
      /// RETURN ERROR CODE IN CASE OF FIREBASE AUTH ERROR
      return error.code;
    } catch (error) {
      /// LOG OTHER ERRORS
      log("$error");
      return "Please Try Again";
    }
  }

  /// FETCH BOOKMARKED NEWS IDS FROM FIREBASE FOR A USER
  Future<void> getBookmarkedNewsIdsFromFirebase() async {
    final DocumentSnapshot response = await firebaseInstance
        .collection("Users")
        .doc('era@gmail.com') // TEMPORARY USER EMAIL FOR DEMONSTRATION
        .get();

    /// STORE BOOKMARKED NEWS IDS LOCALLY
    bookmarkedNewsIds = response["bookmarkedNews"];
  }

  /// LOGIN A USER WITH EMAIL AND PASSWORD
  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      /// SIGN IN USING FIREBASE AUTH
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return ""; // RETURN EMPTY STRING IF SUCCESSFUL
    } on FirebaseAuthException catch (error) {
      /// RETURN ERROR CODE IN CASE OF FIREBASE AUTH ERROR
      return error.code;
    }
  }

  /// ADD OR REMOVE A BOOKMARKED NEWS ITEM TO/FROM FIREBASE
  Future<void> addAndRemoveBookmarkedNewsToFirebase(Article article) async {
    try {
      /// GET FIREBASE USER DOCUMENT REFERENCE
      final userInstance =
          firebaseInstance.collection("Users").doc('era@gmail.com');

      /// FETCH EXISTING BOOKMARKED NEWS IDS
      await getBookmarkedNewsIdsFromFirebase();

      /// CHECK IF THE NEWS ITEM IS ALREADY BOOKMARKED
      if (!bookmarkedNewsIds.contains(article.dateId)) {
        log("Added \n${article.articleMap().toString()}");

        /// ADD NEWS ITEM TO BOOKMARKED NEWS COLLECTION IN FIREBASE
        await firebaseInstance
            .collection("BookmarkedNews")
            .doc(article.dateId)
            .set(article.articleMap());

        /// UPDATE LOCAL LIST AND FIREBASE USER DOCUMENT
        bookmarkedNewsIds.add(article.dateId);
        await userInstance.update({"bookmarkedNews": bookmarkedNewsIds});
      } else {
        /// REMOVE NEWS ITEM FROM LOCAL LIST AND FIREBASE USER DOCUMENT
        bookmarkedNewsIds.remove(article.dateId);
        await userInstance.update({"bookmarkedNews": bookmarkedNewsIds});

        log("Already Saved News");
      }
    } catch (error) {
      /// LOG ERRORS
      log("$error");
    }
  }

  /// FETCH BOOKMARKED NEWS ARTICLES FROM FIREBASE
  Future<List<Article>> getBookMarkedNewsFromFirebase() async {
    try {
      /// GET ALL NEWS ITEMS FROM THE BOOKMARKED NEWS COLLECTION
      final QuerySnapshot response =
          await firebaseInstance.collection("BookmarkedNews").get();

      /// LIST TO STORE BOOKMARKED ARTICLES LOCALLY
      final List<Article> savedArticleList = [];

      /// FETCH EXISTING BOOKMARKED NEWS IDS
      await getBookmarkedNewsIdsFromFirebase();

      /// ITERATE THROUGH THE NEWS DOCUMENTS
      for (int index = 0; index < response.docs.length; index++) {
        /// CHECK IF THE NEWS ITEM IS BOOKMARKED
        if (bookmarkedNewsIds.contains(response.docs[index].id)) {
          /// ADD NEWS ITEM TO LOCAL LIST
          savedArticleList.add(Article(
            dateId: response.docs[index].id,
            author: response.docs[index]['author'],
            title: response.docs[index]['title'],
            description: response.docs[index]['description'],
            url: response.docs[index]['url'],
            urlToImage: response.docs[index]['urlToImage'],
            publishedAt: response.docs[index]['publishedAt'],
            content: response.docs[index]['content'],
          ));
        }
      }

      /// LOG SAVED ARTICLES FOR DEBUGGING
      log(savedArticleList.toString());

      /// RETURN THE LIST OF BOOKMARKED ARTICLES
      return savedArticleList;
    } catch (error) {
      /// LOG ERRORS AND RETURN AN EMPTY LIST
      log("$error");
      return [];
    }
  }
}
