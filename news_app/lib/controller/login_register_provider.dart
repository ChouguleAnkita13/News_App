import 'package:flutter/material.dart';
import 'package:news_app/controller/firebase_data.dart';

class LoginRegisterProvider extends ChangeNotifier {
  final FirebaseData firebaseData = FirebaseData();

  /// TEXT EDITING CONTROLLERS TO HANDLE USER INPUT
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// PRIVATE VARIABLE TO SHOW PASSWORD VISIBILTY
  bool _isPasswordVisible = true;

  /// PRIVATE VARIABLE TO SHOW CHECKBOX STATUS

  bool _isChecked = false;

  /// GETTER TO ACCESS THE PASSWORD VISIBILTY STATUS
  bool get isPasswordVisible => _isPasswordVisible;

  /// GETTER TO ACCESS THE CHECKBOX STATUS
  bool get isChecked => _isChecked;

  /// METHOD TO TOGGLE THE PASSWORD VISIBILTY STATUS
  void togglePassword() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();

    ///NOTIFIES LISTENERS WHEN THE PASSWORD VISIBILTY STATUS CHANGES
  }

  ///
  String loginMessage = "Please Enter Email & Password";

  ///
  String signUpMessage = "Please Enter Email & Password";

  /// METHOD TO TOGGLE THE CHECKBOX STATUS
  void toggleCheckbox() {
    _isChecked = !_isChecked;
    notifyListeners();

    ///NOTIFIES LISTENERS WHEN THE CHECKBOX STATUS CHANGES
  }

  ///
  Future loginWithEmailAndPassword(
      {required String email, required String password}) async {
    loginMessage = await firebaseData.loginWithEmailAndPassword(
        email: email, password: password);
    notifyListeners();
  }

  ///
  Future signUpWithEmailAndPassword(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    if (name.isEmpty) {
      signUpMessage = "Please Enter Name";
    } else if (!isChecked) {
      signUpMessage = "Please Accept Terms and Conditions";
    } else {
      signUpMessage = await firebaseData.signUpWithEmailAndPassword(
          email: email, password: password, phone: phone, name: name);
    }

    notifyListeners();
  }
}
