import 'package:shared_preferences/shared_preferences.dart'; // IMPORT THE SHARED PREFERENCES PACKAGE

/// CLASS TO HANDLE SESSION DATA MANAGEMENT
class SessionData {
  /// VARIABLE TO STORE LOGIN STATUS
  static bool? isLogin;

  /// VARIABLE TO STORE EMAIL
  static String email = "";

  /// VARIABLE TO STORE USERNAME
  static String username = "";

  /// METHOD TO STORE LOGIN STATUS,USERNAME AND EMAIL IN SHARED PREFERENCES
  static Future<void> storeSessionData(
      bool isLogin, String email, String username) async {
    /// OBTAIN AN INSTANCE OF SHARED PREFERENCES
    final SharedPreferences pref = await SharedPreferences.getInstance();

    /// STORE THE LOGIN STATUS USING THE KEY "isLogin"
    pref.setBool("isLogin", isLogin);

    /// STORE THE EMAIL USING THE KEY "email"
    pref.setString("email", email);

    /// STORE THE EMAIL USING THE KEY "username"
    pref.setString("username", username);

    /// CALL getSessionData TO UPDATE THE STATIC VARIABLE isLogin
    getSessionData();
  }

  /// METHOD TO RETRIEVE LOGIN STATUS FROM SHARED PREFERENCES
  static Future<void> getSessionData() async {
    /// OBTAIN AN INSTANCE OF SHARED PREFERENCES
    final SharedPreferences pref = await SharedPreferences.getInstance();

    /// RETRIEVE THE VALUE OF "isLogin" OR SET IT TO false IF IT DOES NOT EXIST
    isLogin = pref.getBool("isLogin") ?? false;

    /// RETRIEVE THE VALUE OF "email" AND "username" OR SET IT TO " " IF IT DOES NOT EXIST
    email = pref.getString("email") ?? "";

    username = pref.getString("username") ?? "";
  }
}
