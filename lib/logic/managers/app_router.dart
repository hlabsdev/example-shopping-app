import 'package:assigame_market/ui/pages/pages.dart';

import '../managers/managers.dart';

export 'package:flutter/material.dart';

// 1
class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  // 2
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppState appState;
  final AppConfig appConfig;

  AppRouter({
    required this.appState,
    required this.appConfig,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appState.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appState.removeListener(notifyListeners);
    appConfig.removeListener(notifyListeners);
    super.dispose();
  }

  // 6
  @override
  Widget build(BuildContext context) {
    // 7
    return Navigator(
      // 8
      key: navigatorKey,
      onPopPage: _handlePopPage,
      // 9
      pages: [
        if (!appState.isInitialized) SplashScreen.page(),
        if (appState.isInitialized && !appState.isLoggedIn) LoginPage.page(),
        if (appState.isInitialized &&
            appState.isLoggedIn &&
            !appState.isSliderComplete)
          SliderScreen.page(),
        if (appState.isInitialized &&
            appState.isLoggedIn &&
            appState.isSliderComplete)
          Home.page(appState.selectedTab),

        // TODO: Create new item
        // TODO: Select GroceryItemScreen
        /* if (settingManager.didSelectUser)
          ProfilePage.page(settingManager.getUser),

        if (appState.isInitialized && appState.didSelectZone) ZonePage.page(),
        if (appState.isInitialized && appState.didSelectZoneList)
          ZoneListPage.page(),
        if (appState.isInitialized &&
            appState.didSelectZoneClients &&
            sharedRepo.selectedZone != -1)
          ZoneClientListPage.page(sharedRepo.selectedZone), */
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    // Handling close, return button press and quit on pages
    if (route.settings.name == AppPages.slider) {
      appState.logout();
    }

    // if (route.setting.name == AppPages.profile) {
    //   appState.tapOnProfile(false);
    // }
    // if (route.setting.name == AppPages.zone) {
    //   appState.tapOnZone(false);
    // }
    // if (route.setting.name == AppPages.zoneList) {
    //   appState.tapOnZoneList(false);
    // }
    // if (route.setting.name == AppPages.zoneClient) {
    //   appState.tapOnZoneClient(false);
    //   sharedRepo.selectedZone = -1;
    // }

    // TODO: Handle state when user closes WebView screen
    // 6
    return true;
  }

  // 10
  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
