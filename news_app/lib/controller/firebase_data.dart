import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/model/newsmodel.dart';

class FirebaseData {
  final FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
  Future<void> addBookmarkedNewsToFirebase(Article article) async {
    try {
      Map<String, dynamic> articleMap = article.articleMap();
      log(articleMap.toString());

      // final DocumentReference docRefId =
      await firebaseInstance
          .collection("BookmarkedNews")
          .doc(article.dateId)
          .set(articleMap);
      // log(docRefId.toString());
    } catch (error) {
      log("$error");
    }
  }

  Future<void> removeBookmarkedNewsfromFirebase(Article article) async {
    try {
      await firebaseInstance
          .collection("BookmarkedNews")
          .doc(article.dateId)
          .delete();
      // log(docRefId.toString());
    } catch (error) {
      log("$error");
    }
  }

  Future<List<Article>> getBookMarkedNewsFromFirebase() async {
    try {
      final QuerySnapshot response =
          await firebaseInstance.collection("BookmarkedNews").get();
      return List.generate(
          response.docs.length,
          (index) => Article(
              dateId: response.docs[index].id,
              author: response.docs[index]['author'],
              title: response.docs[index]['title'],
              description: response.docs[index]['description'],
              url: response.docs[index]['url'],
              urlToImage: response.docs[index]['urlToImage'],
              publishedAt: response.docs[index]['publishedAt'],
              content: response.docs[index]['content']));
    } catch (error) {
      log("$error");
      return [];
    }
  }
}
