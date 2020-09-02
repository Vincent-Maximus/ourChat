import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{

  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceUserNameKey = "USERNAMEKEY";
  static String sharedPreferenceUserEmailKey = "USEREMAILKEY";


  // saving date to Shared{reference

  //saveUserLoggedInSharedPreference
  static Future<bool> saveUserLoggedInSharedPreference(
      bool isUserLoggedIn) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  //saveUserNameSharedPreference
  static Future<bool> saveUserNameSharedPreference(
      String userName) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(sharedPreferenceUserNameKey, userName);
  }

  //saveUserEmailSharedPreference
  static Future<bool> saveUserEmailSharedPreference(
      String userEmail) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(sharedPreferenceUserEmailKey, userEmail);
  }


  //getting data from SharedPreference


  //getUserLoggedInSharedPreference
  static Future<bool> getUserLoggedInSharedPreference() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(sharedPreferenceUserLoggedInKey);
  }

  //getUserEmailSharedPreference
  static Future<String> getUserNameSharedPreference() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPreferenceUserLoggedInKey);
  }

  //getUserEmailSharedPreference
  static Future<String> getUserEmailSharedPreference() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPreferenceUserEmailKey);
  }




}


