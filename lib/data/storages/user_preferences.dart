import 'package:shared_preferences/shared_preferences.dart';

///@Hlabs: User prefences using the sharedPreferences package. This is customized to be used in a direct acces form (no need to await anymore)
class UserPreferences {
  static final UserPreferences? _instance = UserPreferences._ctor();

  factory UserPreferences() {
    return _instance!;
  }

  UserPreferences._ctor();

  ///@Hlabs: This is private it shouldn't be acced from outside the UserPreferences Class in order to avoid using [await ~~ async]
  SharedPreferences? _prefs;

  ///@Hlabs: Initiate a global instance of preference from disk so don't await it
  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  ///@Hlabs: Remove all user related data from preferences. In instance:
  ///[[isLoggedIn, user, token, cart]]
  dispose() async {
    // await _prefs!.clear();
    await _prefs!.remove("isLoggedIn");
    await _prefs!.remove("user");
    await _prefs!.remove("token");
    await _prefs!.remove("cart");
  }

  ///@Hlabs: In order to find if the key exist in the actual instance of preferences
  find(String key) {
    return _prefs!.containsKey(key);
  }

  ///@Hlabs: Relaod the preference to track new change made by some action
  reload() async {
    await _prefs!.reload();
  }

  /* Authentication deb */
  String get user {
    return _prefs!.getString("user") ?? "";
  }

  set user(String value) {
    _prefs!.setString("user", value);
  }

  String get token {
    return _prefs!.getString("token") ?? "";
  }

  set token(String value) {
    _prefs!.setString("token", value);
  }

  bool get isLoggedIn {
    return _prefs!.getBool("isLoggedIn") ?? false;
  }

  set isLoggedIn(bool value) {
    _prefs!.setBool("isLoggedIn", value);
  }
  /* Authentication end */

  bool get sliderComplete {
    return _prefs!.getBool("sliderComplete") ?? false;
  }

  set sliderComplete(bool value) {
    _prefs!.setBool("sliderComplete", value);
  }

  String get profile {
    return _prefs!.getString("profile") ?? "";
  }

  set profile(String value) {
    _prefs!.setString("profile", value);
  }

  String get lang {
    return _prefs!.getString("lang") ?? "";
  }

  set lang(String value) {
    _prefs!.setString("lang", value);
  }

  String get cart {
    return _prefs!.getString("cart") ?? "";
  }

  set cart(String value) {
    _prefs!.setString("cart", value);
  }

  /* Server Url deb */
  String get serverUrl {
    return _prefs!.getString("serverUrl") ?? "";
  }

  set serverUrl(String value) {
    _prefs!.setString("serverUrl", value);
  }
  /* Server Url end */

  /*Bool values start*/
  bool get darkMode {
    return _prefs!.getBool("darkMode") ?? false;
  }

  set darkMode(bool value) {
    _prefs!.setBool("darkMode", value);
  }

  bool get online {
    return _prefs!.getBool("online") ?? false;
  }

  set online(bool value) {
    _prefs!.setBool("online", value);
  }
  /*Bool values end*/
}
