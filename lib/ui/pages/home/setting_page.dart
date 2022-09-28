import 'package:assigame_market/logic/managers/app_router.dart';
import 'package:assigame_market/logic/managers/managers.dart';
import 'package:assigame_market/logic/utils/functions.dart';
import 'package:assigame_market/ui/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({
    Key? key,
  }) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppConfig>(builder: (context, appConfig, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16.0),
          Expanded(
            child: buildMenu(appConfig),
          )
        ],
      );
    });
  }

  Widget buildMenu(AppConfig config) {
    return ListView(
      children: [
        buildDarkModeRow(config),
        const SizedBox(height: 10.0),
        buildLangRow(config),
        const SizedBox(height: 10.0),
        buildLogout()
      ],
    );
  }

  ListTile buildLogout() {
    return ListTile(
      title: Text(
        AppLang.of(context)!.logout.toUpperCase(),
        style: TextStyle(color: AppColors.assigameRed),
      ),
      onTap: () {
        Provider.of<AppState>(context, listen: false).goToDiscover();
        Provider.of<AppState>(context, listen: false).logout();
      },
      trailing: const Icon(Icons.chevron_right_rounded),
    );
  }

  Widget buildDarkModeRow(AppConfig config) {
    return ListTile(
      title: Text(AppLang.of(context)!.darkmode,
          style: Theme.of(context).textTheme.bodyText1),
      trailing: Switch(
        value: config.darkMode,
        onChanged: (value) {
          Provider.of<AppConfig>(context, listen: false).darkMode = value;
        },
      ),
    );
  }

  Widget buildLangRow(AppConfig config) {
    return ListTile(
      title: Text(AppLang.of(context)!.lang),
      subtitle: Text(FunctionUtils.getLangText(context, config.lang)),
      onTap: () {
        setLang(config);
      },
      trailing: const Icon(Icons.chevron_right_rounded),
    );
  }

  void setLang(AppConfig config) {
    TextStyle selectedLangStyle = TextStyle(color: AppColors.accentColor);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLang.of(context)!.changeLang),
            content: SizedBox(
              height: MediaQuery.of(context).size.width / 2,
              child: ListView.builder(
                itemCount: AppLang.supportedLocales.length,
                itemBuilder: (BuildContext context, int i) {
                  return buildLangTile(
                      config,
                      AppLang.supportedLocales[i].languageCode,
                      selectedLangStyle);
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        AppLang.of(context)!.langChangeSuccess,
                        style: TextStyle(color: AppColors.assigameWhite),
                      ),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                },
                child: Text(AppLang.of(context)!.done),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(AppLang.of(context)!.cancel),
              ),
            ],
          );
        });
  }

  Widget buildLangTile(
      AppConfig config, String lang, TextStyle selectedLangStyle) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      elevation: 2,
      child: ListTile(
          // contentPadding: const EdgeInsets.all(5),
          horizontalTitleGap: 15,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          selected: lang == config.lang,
          title: Text(
            FunctionUtils.getLangText(context, lang),
            style: lang == config.lang ? selectedLangStyle : null,
          ),
          onTap: () {
            config.lang = lang;
          }),
    );
  }
}
