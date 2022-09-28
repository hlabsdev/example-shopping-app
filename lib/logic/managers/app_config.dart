import 'package:assigame_market/data/storages/entities/entities.dart';
import 'package:assigame_market/data/storages/user_preferences.dart';
import 'package:flutter/foundation.dart';

class AppConfig extends ChangeNotifier {
  UserConfig get userConfig => UserConfig(
        // user: _user,
        online: _online,
        darkMode: _darkMode,
        profile: _profile,
        lang: _lang,
      );

  // User get user => _user;
  bool get online => _online;
  bool get darkMode => _darkMode;
  String get profile => _profile;
  String get lang => _lang;

  bool _online =
      UserPreferences().find("darkMode") ? UserPreferences().online : false;
  bool _darkMode =
      UserPreferences().find("darkMode") ? UserPreferences().darkMode : false;
  String _lang = UserPreferences().find("lang") ? UserPreferences().lang : "fr";
  String _profile =
      UserPreferences().find("profile") ? UserPreferences().profile : "1";

  /*User _user = UserPreferences().find("user")
      ? UserPreferences().user.isEmpty
      ? const User()
      : User.fromJson(jsonDecode(UserPreferences().user))
      : const User();*/

  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    UserPreferences().darkMode = darkMode;
    notifyListeners();
  }

  set profile(String profile) {
    _profile = profile;
    UserPreferences().profile = profile;
    notifyListeners();
  }

  set lang(String lang) {
    _lang = lang;
    UserPreferences().lang = lang;
    notifyListeners();
  }

  set setOnline(bool online) {
    _online = online;
    notifyListeners();
  }

  /// Call this directly after succefully Login in
  /* void setUser(User user) {
    _user = user;
    notifyListeners();
  }*/

  void initializeDarkMode(bool darkMode) {
    _darkMode = darkMode;
    UserPreferences().darkMode = darkMode;
  }

  void initializeLang(String lang) {
    _lang = lang;
    UserPreferences().lang = lang;
  }

/*
  void initializeUser(User user) {
    _user = user;
  }*/

}
