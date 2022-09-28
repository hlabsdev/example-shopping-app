import 'dart:async';

import 'package:assigame_market/data/storages/user_preferences.dart';
import 'package:flutter/foundation.dart';

// 1
class AppTab {
  static const int discover = 0;
  static const int live = 1;
  static const int account = 2;
  static const int settings = 3;
}

class AppState extends ChangeNotifier {
  /* Private valriable definition start */
  bool _initialized = false;
  bool _loggedIn = false;
  bool _sliderComplete = false;
  bool _error = false;
  int _selectedTab = AppTab.discover;
  String _message = "";

  //Navigation
  bool _tapOnProfile = false;
  bool _tapOnOrders = false;
  bool _tapOnCampaign = false;
  bool _tapOnContacts = false;
  bool _tapOnMyShop = false;
  bool _tapOnProducts = false;
  bool _tapOnCreateShop = false;
  bool _tapOnMessages = false;
  bool _tapOnTransactions = false;
  bool _tapOnMap = false;
  /* Private valriable definition end */

  /* Public Getters start */
  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isSliderComplete => _sliderComplete;
  bool get error => _error;
  int get selectedTab => _selectedTab;
  String get message => _message;

  //Navigation
  bool get tapOnProfile => _tapOnProfile;
  bool get tapOnOrders => _tapOnOrders;
  bool get tapOnCampaign => _tapOnCampaign;
  bool get tapOnContacts => _tapOnContacts;
  bool get tapOnMyShop => _tapOnMyShop;
  bool get tapOnProducts => _tapOnProducts;
  bool get tapOnCreateShop => _tapOnCreateShop;
  bool get tapOnMessages => _tapOnMessages;
  bool get tapOnTransactions => _tapOnTransactions;
  bool get tapOnMap => _tapOnMap;
  /* Public Getters end */

  /*Function start*/
  void initializeApp() {
    Timer(
      const Duration(microseconds: 2500),
      () {
        // Check if the shared_preferences contain something
        if (UserPreferences().find("userLogin")) {
          _loggedIn = UserPreferences().isLoggedIn;
        }
        // if (UserPreferences().find("sliderComplete")) {
        //   _sliderComplete = UserPreferences().sliderComplete;
        // }
        _initialized = true;
        notifyListeners();
      },
    );
  }

  void completeSlider() {
    _sliderComplete = true;
    UserPreferences().sliderComplete = true;
    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    // LoginQuery query = LoginQuery(username: username, password: password);
    // /* final response =  */
    // await ApiService().login(query).then((response) {
    //   if (response is LoginResponse) {
    //     UserPreferences().token = response.token!;
    //     UserPreferences().user = jsonEncode(response.user!.toJson());
    //     UserPreferences().userLogin = true;
    //     _loggedIn = true;
    //   } else {
    //     _error = true;
    //     _message = response;
    //   }
    // });

    _loggedIn = true;
    notifyListeners();
  }

  set error(bool error) {
    _error = error;
    notifyListeners();
  }

  set message(String message) {
    _message = message;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    _sliderComplete = false;
    _initialized = false;
    _selectedTab = 0;
    UserPreferences().dispose().then((response) {
      initializeApp();
    });
    notifyListeners();
  }
  /*Function end*/

  /* Home navigation start */
  void goToLogin() {
    _loggedIn = false;
    notifyListeners();
  }

  void goToTab(index) {
    if (index < 0) index = 0;
    if (index > 3) index = 3;
    _selectedTab = index;
    notifyListeners();
  }

  void goToDiscover() {
    _selectedTab = AppTab.discover;
  }

  void goToaccount() {
    _selectedTab = AppTab.account;
  }

  void goToLive() {
    _selectedTab = AppTab.live;
  }

  void goToSettings() {
    _selectedTab = AppTab.settings;
  }
  /* Home navigation end */

  /* Global navigation start */
  void goToProfile(bool selected) {
    _tapOnProfile = selected;
    notifyListeners();
  }

  void goToOrders(bool selected) {
    _tapOnOrders = selected;
    notifyListeners();
  }

  void goToCampaign(bool selected) {
    _tapOnCampaign = selected;
    notifyListeners();
  }

  void goToContacts(bool selected) {
    _tapOnContacts = selected;
    notifyListeners();
  }

  void goToMyShop(bool selected) {
    _tapOnMyShop = selected;
    notifyListeners();
  }

  void goToProducts(bool selected) {
    _tapOnProducts = selected;
    notifyListeners();
  }

  void goToCreateShop(bool selected) {
    _tapOnCreateShop = selected;
    notifyListeners();
  }

  void goToMessages(bool selected) {
    _tapOnMessages = selected;
    notifyListeners();
  }

  void goToTransactions(bool selected) {
    _tapOnTransactions = selected;
    notifyListeners();
  }

  void goToMap(bool selected) {
    _tapOnMap = selected;
    notifyListeners();
  }
/* Global navigation end */

/* 
  Future<String> getAllData() async {
    String result = "";
    await ApiService().getZones("").then((response) {
      if (response.zones != null) {
        UserPreferences().zones = jsonEncode(response);
        _upToDate = true;
        result = response.message!;
      } else {
        _error = true;
        _message = response.message!;
        result = response.message!;
      }
    });
    debugPrint(result);
    notifyListeners();
    return result;
  }

// Navigation vers differentes pages
  void tapOnZone(bool selected) {
    _didSelectZone = selected;
    notifyListeners();
  }

  void tapOnZoneList(bool selected) {
    _didSelectZoneList = selected;
    notifyListeners();
  }

  void tapOnZoneClient(bool selected) {
    _didSelectZoneClients = selected;
    notifyListeners();
  } */

}
