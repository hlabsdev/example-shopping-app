import 'package:assigame_market/data/storages/user_preferences.dart';
import 'package:assigame_market/logic/managers/app_router.dart';
import 'package:assigame_market/logic/utils/functions.dart';
import 'package:assigame_market/ui/styles/styles.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'logic/managers/managers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initialisatrion de la clase UserPrefernce
  await UserPreferences().init();
  runApp(const AssigameMarket());
  //TODO: Add a notification manager initialisation
}

class AssigameMarket extends StatefulWidget {
  const AssigameMarket({Key? key}) : super(key: key);

  @override
  State<AssigameMarket> createState() => _AssigameMarketState();
}

class _AssigameMarketState extends State<AssigameMarket> {
  //All managers and providers initialisation
  final _appState = AppState();
  final _appConfig = AppConfig();
  late AppRouter _appRouter;

  //TODO: Add connectivity check here if needed
  // Pour checker la connexion continuellement
  Map _source = {ConnectivityResult.none: false};
  final MyConnectivity _connectivity = MyConnectivity.instance;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    //Iniatilizing navigation manager
    _appRouter = AppRouter(
      appState: _appState,
      appConfig: _appConfig,
    );
    // Pour checker la connexion continuellement
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
  }

  ///@Hlabs: For rebuildgind the app after lang change
  // static void setLocale(BuildContext context, Locale newLocale) {
  //   _AssigameMarketState state = context.ancestorStateOfType(TypeMatcher<_MyAppState>());
  //
  //   state.setState(() {
  //     state.locale = newLocale;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _appState),
        ChangeNotifierProvider(create: (context) => _appConfig),
        // ChangeNotifierProvider(lazy: false, create: (context) => _sharedRepo),
      ],
      child: Consumer<AppConfig>(builder: (context, appConfig, child) {
        ThemeData theme;
        if (appConfig.darkMode) {
          theme = AppTheme.dark();
        } else {
          theme = AppTheme.light();
          false;
        }
        //TODO: Add notifier config
        /* Toujour checker lespermissions du notificateur */
        AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
          if (!isAllowed) {
            // This is just a basic example. For real apps, you must show some
            // friendly dialog box before call the request method.
            // This is very important to not harm the user experience
            AwesomeNotifications().requestPermissionToSendNotifications();
          }
        });

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Assigame Market",
          locale: FunctionUtils.getLocaleLang(appConfig.lang),
          /*localizationsDelegates: const [
            AppLangDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],*/
          localizationsDelegates: AppLang.localizationsDelegates,
          supportedLocales: const [
            Locale('en', 'US'), // English
            Locale('fr', 'FR'), // French
          ],
          theme: theme,
          home: Router(
            routerDelegate: _appRouter,
            backButtonDispatcher: RootBackButtonDispatcher(),
          ),
        );
      }),
    );
  }
}
