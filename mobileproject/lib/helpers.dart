import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  //keys
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userPhotoKey = "USERPHOTOKEY";
  static String userNiveauKey = "USERNIVEAUKEY";
  // saving the data to SF

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }

  static Future<bool> saveUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }
  static Future<bool> saveUserPhotoSF(String photo) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userPhotoKey, photo);
  }
  static Future<bool> saveUserNiveauSF(String niveau) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNiveauKey, niveau);
  }

  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }

  static Future<String?> getUserPhotoFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userPhotoKey);
  }
  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }

  static Future<String?> getUserNiveauFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNiveauKey);
  }
}