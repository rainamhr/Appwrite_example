import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static String username = "USERNAME";
  static String password = "PASSWORD";
  static String isLogin = "ISLOGIN";

  static SessionManager sessionManager;
  static SharedPreferences sharedPreference;

  static Future getInstance() async {
    if (sessionManager == null) {
      // keep local instance till it is fully initialized.
      var secureStorage = SessionManager._();
      await secureStorage._init();
      sessionManager = secureStorage;
    }
    return sessionManager;
  }

  SessionManager._();

  Future _init() async {
    sharedPreference = await SharedPreferences.getInstance();
  }

  // get string
  static Future getEmail(String key, {String defValue = ''}) async {
    if (sharedPreference == null) return defValue;
    return await sharedPreference.getString(key) ?? defValue;
  }

  // put string
  static Future setEmail(String key, String email) async {
    if (sharedPreference == null) return null;
    return await sharedPreference.setString(key, email);
  }

  static removeProfile(String key) async {
    await sharedPreference.remove(key);
  }

  /// ------------------------------------------------------------
  /// Method that returns the user decision to allow notifications
  /// ------------------------------------------------------------
/*  setProfile(String uname, String pass) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(username, uname);
    prefs.setString(password, pass);
  }

  setLogin(bool login) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLogin, login);
  }

  getLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    bool login = await prefs.getBool(isLogin);
    print("bool==============");
    print(login.toString());
    return login;
  }

  getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = await prefs.getString(username);
    return stringValue;
  }

  getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = await prefs.getString(password);
    return stringValue;
  }

  removeProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(username);
    prefs.remove(password);
  }*/
}
