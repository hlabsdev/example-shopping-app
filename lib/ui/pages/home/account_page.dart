import 'package:assigame_market/logic/managers/app_router.dart';
import 'package:assigame_market/logic/managers/managers.dart';
import 'package:assigame_market/ui/styles/app_colors.dart';
import 'package:assigame_market/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({
    Key? key,
  }) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppConfig>(builder: (context, appConfig, child) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            buildProfile(appConfig),
            Expanded(
              child: buildMenu(appConfig),
            )
          ],
        ),
        /*floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: AppLang.of(context)!.update_account,
          child: const Icon(Icons.edit_rounded),
          elevation: 2,
        ),*/
      );
    });
  }

  Widget buildMenu(AppConfig config) {
    return ListView(
      children: [
        ExpansionTile(
          iconColor: AppColors.accentColor,
          title: Text(AppLang.of(context)!.myInfos,
              style: Theme.of(context).textTheme.bodyText1),
          children: [buildInfos(config)],
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

  Widget buildProfile(AppConfig config) {
    String image =
        "https://miro.medium.com/max/804/1*0KSvGXkFF5Qbzwm7ersjlA.png";
    /*String image = "";
    if (config.userConfig.user!.personnel!.avatar != null) {
      image = config.userConfig.user!.personnel!.avatar!;
    } else {
    String image =
        "https://miro.medium.com/max/804/1*0KSvGXkFF5Qbzwm7ersjlA.png";
    }*/
    return Column(
      children: [
        CircleImage(
          imageProvider: NetworkImage(image),
          imageRadius: 60.0,
        ),
        const SizedBox(height: 16.0),
        const Text(
          // config.userConfig.user!.personnel!.nomComplet!,
          "Hermann Kekeli GOLO",
          style: TextStyle(fontSize: 21),
        ),
      ],
    );
  }

  Widget buildInfos(AppConfig config) {
    // final me = config.userConfig.user!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
      child: ListView(
        shrinkWrap: true,
        // itemExtent: 3,
        children: [
          // Username
          buildInfoTile(AppLang.of(context)!.username, "Hlabs"),
          // Nom
          buildInfoTile(AppLang.of(context)!.name, "GOLO"),
          // Prenoms
          buildInfoTile(AppLang.of(context)!.firstname, "Hermann Kekeli"),
          // Sexe
          buildInfoTile(AppLang.of(context)!.sex, "Masculin"),
          // Contact
          buildInfoTile(AppLang.of(context)!.contact, "+228 91 02 52 63"),
          // Adresse
          buildInfoTile(AppLang.of(context)!.address, "Djagble"),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(AppLang.of(context)!.updateAccount),
                FloatingActionButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  tooltip: AppLang.of(context)!.updateAccount,
                  child: const Icon(Icons.edit_rounded),
                  elevation: 2,
                  mini: true,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildInfoTile(String label, String value) {
    return ListTile(
      tileColor: Theme.of(context).cardTheme.color,
      dense: true,
      visualDensity: VisualDensity.compact,
      // horizontalTitleGap: 60,
      minLeadingWidth: 120,
      // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      leading: Text(label + ": ",
          style: const TextStyle(fontStyle: FontStyle.italic)),
      // title: Text("Adresse: " + me.personnel!.adresse!,
      title: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
