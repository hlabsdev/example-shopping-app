import 'dart:async';
import 'dart:io';

import 'package:assigame_market/data/storages/user_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class MyConnectivity {
  MyConnectivity._();

  static final _instance = MyConnectivity._();
  static MyConnectivity get instance => _instance;
  final _connectivity = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get myStream => _controller.stream;
  String server = "";

  void initialise() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _checkStatus(result);
    _connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void getServerAddress() {
    if (UserPreferences().find("serverUrl") &&
        UserPreferences().serverUrl.isNotEmpty) {
      server = UserPreferences().serverUrl.replaceAll("/mobile", "");
    }
  }

  void _checkStatus(ConnectivityResult result) async {
    getServerAddress();
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup(server);
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  void disposeStream() => _controller.close();
}
