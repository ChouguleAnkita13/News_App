import 'package:shared_preferences/shared_preferences.dart'; // IMPORT THE SHARED PREFERENCES PACKAGE

/// CLASS TO HANDLE SESSION DATA MANAGEMENT
class SessionData {
  /// VARIABLE TO STORE LOGIN STATUS
  static bool? isLogin;

  /// METHOD TO STORE LOGIN STATUS IN SHARED PREFERENCES
  static Future<void> storeSessionData(bool isLogin) async {
    /// OBTAIN AN INSTANCE OF SHARED PREFERENCES
    final SharedPreferences pref = await SharedPreferences.getInstance();

    /// STORE THE LOGIN STATUS USING THE KEY "isLogin"
    pref.setBool("isLogin", isLogin);

    /// CALL getSessionData TO UPDATE THE STATIC VARIABLE isLogin
    getSessionData();
  }

  /// METHOD TO RETRIEVE LOGIN STATUS FROM SHARED PREFERENCES
  static Future<void> getSessionData() async {
    /// OBTAIN AN INSTANCE OF SHARED PREFERENCES
    final SharedPreferences pref = await SharedPreferences.getInstance();

    /// RETRIEVE THE VALUE OF "isLogin" OR SET IT TO false IF IT DOES NOT EXIST
    isLogin = pref.getBool("isLogin") ?? false;
  }
}
