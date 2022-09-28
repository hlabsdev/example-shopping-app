import 'dart:async';

import 'package:assigame_market/logic/managers/app_router.dart';
import 'package:assigame_market/logic/managers/managers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: AppPages.splash,
      key: ValueKey(AppPages.splash),
      child: const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    Timer(
      const Duration(microseconds: 2500),
      () {
        Provider.of<AppState>(context, listen: false).initializeApp();
      },
    );
    super.didChangeDependencies();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 200),
            const Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 200,
                child: Image(
                  image: AssetImage('assets/icon.png'),
                ),
              ),
            ),
            const SizedBox(height: 200),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(AppLang.of(context)!.provider),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
