import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/model/newsmodel.dart';

class FirebaseData {
  final FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  List bookmarkedNewsIds = [];

  Future<String> signUpWithEmailAndPassword(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await firebaseInstance.collection("Users").doc(email).set({
        "username": name,
        "Phone": phone,
        "email": email,
        "password": password,
        "bookmarkedNews": []
      });
      return "";
    } on FirebaseAuthException catch (error) {
      return error.code;
    } catch (error) {
      log("$error");
      return "Please Try Again";
    }
  }

  Future<void> getBookmarkedNewsIdsFromFirebase() async {
    final DocumentSnapshot response =
        await firebaseInstance.collection("Users").doc('era@gmail.com').get();

    bookmarkedNewsIds = response["bookmarkedNews"];
  }

  ///
  Future<String> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "";
    } on FirebaseAuthException catch (error) {
      return error.code;
    }
  }

  ///
  Future<void> addAndRemoveBookmarkedNewsToFirebase(Article article) async {
    try {
      final userInstance =
          firebaseInstance.collection("Users").doc('era@gmail.com');

      ///
      await getBookmarkedNewsIdsFromFirebase();
      if (!bookmarkedNewsIds.contains(article.dateId)) {
        log("Added \n${article.articleMap().toString()}");

        await firebaseInstance
            .collection("BookmarkedNews")
            .doc(article.dateId)
            .set(article.articleMap());

        bookmarkedNewsIds.add(article.dateId);

        await userInstance.update({"bookmarkedNews": bookmarkedNewsIds});
      } else {
        bookmarkedNewsIds.remove(article.dateId);
        await userInstance.update({"bookmarkedNews": bookmarkedNewsIds});

        log("Already Saved News");
      }

      // log(docRefId.toString());
    } catch (error) {
      log("$error");
    }
  }

  Future<List<Article>> getBookMarkedNewsFromFirebase() async {
    try {
      final QuerySnapshot response =
          await firebaseInstance.collection("BookmarkedNews").get();
      final List<Article> savedArticleList = [];
      await getBookmarkedNewsIdsFromFirebase();
      for (int index = 0; index < response.docs.length; index++) {
        if (bookmarkedNewsIds.contains(response.docs[index].id)) {
          savedArticleList.add(Article(
              dateId: response.docs[index].id,
              author: response.docs[index]['author'],
              title: response.docs[index]['title'],
              description: response.docs[index]['description'],
              url: response.docs[index]['url'],
              urlToImage: response.docs[index]['urlToImage'],
              publishedAt: response.docs[index]['publishedAt'],
              content: response.docs[index]['content']));
        }
      }

      log(savedArticleList.toString());

      return savedArticleList;
    } catch (error) {
      log("$error");
      return [];
    }
  }
}
