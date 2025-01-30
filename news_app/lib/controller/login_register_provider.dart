import 'package:flutter/material.dart';
import 'package:news_app/controller/firebase_data.dart';

/// PROVIDER CLASS TO HANDLE LOGIN, REGISTRATION, AND USER INPUT STATES
class LoginRegisterProvider extends ChangeNotifier {
  /// INSTANCE OF FIREBASEDATA CLASS TO HANDLE FIREBASE OPERATIONS
  final FirebaseData firebaseData = FirebaseData();

  /// TEXT EDITING CONTROLLERS TO HANDLE USER INPUT
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// PRIVATE VARIABLE TO TRACK PASSWORD VISIBILITY
  bool _isPasswordVisible = true;

  /// PRIVATE VARIABLE TO TRACK CHECKBOX STATUS
  bool _isChecked = false;

  /// GETTER TO ACCESS THE PASSWORD VISIBILITY STATUS
  bool get isPasswordVisible => _isPasswordVisible;

  /// GETTER TO ACCESS THE CHECKBOX STATUS
  bool get isChecked => _isChecked;

  /// METHOD TO TOGGLE THE PASSWORD VISIBILITY STATUS
  void togglePassword() {
    _isPasswordVisible = !_isPasswordVisible;

    /// NOTIFIES LISTENERS WHEN THE PASSWORD VISIBILITY STATUS CHANGES
    notifyListeners();
  }

  /// STRING VARIABLE TO STORE LOGIN MESSAGE
  String loginMessage = "Please Enter Email & Password";

  /// STRING VARIABLE TO STORE SIGN-UP MESSAGE
  String signUpMessage = "Please Enter Email & Password";

  /// METHOD TO TOGGLE THE CHECKBOX STATUS
  void toggleCheckbox() {
    _isChecked = !_isChecked;

    /// NOTIFIES LISTENERS WHEN THE CHECKBOX STATUS CHANGES
    notifyListeners();
  }

  /// METHOD TO HANDLE LOGIN FUNCTIONALITY USING EMAIL AND PASSWORD
  Future loginWithEmailAndPassword(
      {required String email, required String password}) async {
    /// CALL FIREBASEDATA FUNCTION TO LOG IN AND UPDATE THE LOGIN MESSAGE
    loginMessage = await firebaseData.loginWithEmailAndPassword(
        email: email, password: password);
  }

  /// METHOD TO HANDLE LOGOUT FUNCTIONALITY
  Future logOutUserOfNewsAppFromFirebase() async {
    /// CALL FIREBASEDATA FUNCTION TO LOGOUT
    await firebaseData.logOutUser();
  }

  /// METHOD TO HANDLE SIGN-UP FUNCTIONALITY USING EMAIL, PASSWORD, NAME, AND PHONE
  Future signUpWithEmailAndPassword(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    /// VALIDATE NAME INPUT
    if (name.isEmpty) {
      signUpMessage = "Please Enter Name";
    }

    /// VALIDATE IF TERMS AND CONDITIONS ARE ACCEPTED
    else if (!isChecked) {
      signUpMessage = "Please Accept Terms and Conditions";
    }

    /// PROCEED WITH SIGN-UP IF VALIDATION PASSES
    else {
      signUpMessage = await firebaseData.signUpWithEmailAndPassword(
          email: email, password: password, phone: phone, name: name);
    }

    /// NOTIFIES LISTENERS TO UPDATE THE UI
    notifyListeners();
  }
}
