import 'package:assigame_market/logic/managers/app_router.dart';
import 'package:assigame_market/logic/managers/managers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerMenuItem {
  final String title;
  final IconData icon;
  List<DrawerMenuItem>? children;
  void Function()? onTap;

  DrawerMenuItem(
      {required this.title, required this.icon, this.children, this.onTap});
}

class DrawerMenuWidget extends StatelessWidget {
  const DrawerMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppConfig>(builder: (context, appConfig, child) {
      /// 0=>seller, 1=>buyer , 2=>driver
      List<DrawerMenuItem> menu = [];

      ///Seller menus
      if (appConfig.userConfig.profile == "0") {
        //1 Home
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.home,
              icon: Icons.home_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToDiscover;
              }),
        );
        //2 Create shop
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.createShop,
              icon: Icons.storefront_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToCreateShop;
              }),
        );
        //3 Products
        menu.add(
          DrawerMenuItem(
            title: AppLang.of(context)!.products,
            icon: Icons.archive_rounded,
            onTap: () {
              Provider.of<AppState>(context, listen: false).goToProducts;
            },
            children: [
              //4 Transactions
              DrawerMenuItem(
                  title: AppLang.of(context)!.transaction + "s",
                  icon: Icons.attach_money_rounded,
                  onTap: () {
                    Provider.of<AppState>(context, listen: false)
                        .goToTransactions;
                  }),
              //6 Maps
              DrawerMenuItem(
                  title: AppLang.of(context)!.map,
                  icon: Icons.map_rounded,
                  onTap: () {
                    Provider.of<AppState>(context, listen: false).goToMap;
                  }),
            ],
          ),
        );
        //4 My shop
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.myShop,
              icon: Icons.shopping_bag_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToMyShop;
              }),
        );
        //5 Contacts
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.contact + "s",
              icon: Icons.perm_contact_calendar_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToContacts;
              }),
        );
        //6 Campaigns
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.campaign + "s",
              icon: Icons.campaign_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToCampaign;
              }),
        );
        //7 Orders
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.order + "s",
              icon: Icons.playlist_add_check_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToOrders;
              }),
        );
      }

      ///Buyer menus
      else if (appConfig.userConfig.profile == "1") {
        //1 Home
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.home,
              icon: Icons.home_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToDiscover;
              }),
        );
        //2 Messages
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.message + "s",
              icon: Icons.message_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToMessages;
              }),
        );
        //3 Orders
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.order + "s",
              icon: Icons.playlist_add_check_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToOrders;
              }),
        );
        //4 Transactions
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.transaction + "s",
              icon: Icons.attach_money_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToTransactions;
              }),
        );
        //5 Contacts
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.contact + "s",
              icon: Icons.perm_contact_calendar_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToContacts;
              }),
        );
        //6 Maps
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.map,
              icon: Icons.map_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToMap;
              }),
        );
      }

      ///Driver menus
      else if (appConfig.userConfig.profile == "2") {
        //1 Home
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.home,
              icon: Icons.home_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToDiscover;
              }),
        );
        //2 Messages
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.message + "s",
              icon: Icons.message_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToMessages;
              }),
        );
        //3 Orders
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.order + "s",
              icon: Icons.playlist_add_check_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToOrders;
              }),
        );
        //4 Transactions
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.transaction + "s",
              icon: Icons.attach_money_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToTransactions;
              }),
        );
        //5 Contacts
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.contact + "s",
              icon: Icons.perm_contact_calendar_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToContacts;
              }),
        );
        //6 Maps
        menu.add(
          DrawerMenuItem(
              title: AppLang.of(context)!.map,
              icon: Icons.map_rounded,
              onTap: () {
                Provider.of<AppState>(context, listen: false).goToMap;
              }),
        );
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(AppLang.of(context)!.profile +
                ": ${(appConfig.profile == "0" ? AppLang.of(context)!.seller : AppLang.of(context)!.buyer).toUpperCase()}"),
            trailing: Switch(
              value: appConfig.profile == "0" ? true : false,
              onChanged: (value) {
                Provider.of<AppConfig>(context, listen: false).profile =
                    value ? "0" : "1";
              },
            ),
          ),
          const SizedBox(height: 5),
          ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              DrawerMenuItem item = menu[index];
              // return (item.children == null || item.children!.isEmpty)
              return (item.children == null)
                  ? SingleDrawerMenuWidget(item: item)
                  : ExpandeableDrawerMenuWidget(item: item);
            }),
            separatorBuilder: ((context, index) {
              return const SizedBox(height: 5);
            }),
            itemCount: menu.length,
          ),
        ],
      );
    });
  }
}

class ExpandeableDrawerMenuWidget extends StatelessWidget {
  const ExpandeableDrawerMenuWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final DrawerMenuItem item;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      controlAffinity: ListTileControlAffinity.platform,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10),
      leading: Icon(item.icon, color: Theme.of(context).shadowColor),
      title: Text(item.title),
      children: List.generate(
        item.children!.length,
        (i) => SingleDrawerMenuWidget(item: item.children![i]),
      ),
    );
  }
}

class SingleDrawerMenuWidget extends StatelessWidget {
  const SingleDrawerMenuWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final DrawerMenuItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      // dense: true,
      leading: Icon(item.icon, color: Theme.of(context).shadowColor),
      title: Text(item.title),
      onTap: item.onTap,
    );
  }
}
