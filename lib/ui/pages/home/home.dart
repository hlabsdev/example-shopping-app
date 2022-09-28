import 'dart:math';

import 'package:assigame_market/logic/managers/app_router.dart';
import 'package:assigame_market/logic/managers/managers.dart';
import 'package:assigame_market/ui/pages/pages.dart';
import 'package:assigame_market/ui/styles/app_colors.dart';
import 'package:assigame_market/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: AppPages.home,
      key: ValueKey(AppPages.home),
      child: Home(
        currentTab: currentTab,
      ),
    );
  }

  const Home({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  final int currentTab;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController searchTextController;
  final ScrollController _scrollController = ScrollController();

  int currentCount = 0;
  int currentStartPosition = 0;
  int currentEndPosition = 20;
  int pageCount = 20;
  bool hasMore = false;
  bool loading = false;
  bool inErrorState = false;
  bool isSearching = false;

  static List<Widget> pages = <Widget>[
    const DiscoverPage(),
    const LivePage(),
    const AccountPage(),
    const SettingPage(),
  ];

  @override
  void initState() {
    super.initState();
    // TODO: initiate repository here

    // Serach box and list behavior
    searchTextController = TextEditingController(text: '');
    _scrollController.addListener(() {
      final triggerFetchMoreSize =
          0.7 * _scrollController.position.maxScrollExtent;

      if (_scrollController.position.pixels > triggerFetchMoreSize) {
        if (hasMore &&
            currentEndPosition < currentCount &&
            !loading &&
            !inErrorState) {
          setState(() {
            loading = true;
            currentStartPosition = currentEndPosition;
            currentEndPosition =
                min(currentStartPosition + pageCount, currentCount);
          });
        }
      }
    });
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appStateManager, child) {
        return Scaffold(
          appBar: AppBar(
            // backgroundColor: AppColors.accentColor,
            centerTitle: true,
            elevation: 1,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Builder(
                builder: (context) => IconButton(
                  iconSize: 30,
                  color: AppColors.mainColor,
                  icon: Image(
                    // height: 100,
                    // width: 100,
                    color: AppColors.mainColor,
                    image: const AssetImage('assets/drawer.png'),
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.all(0.0),
              child: _buildSearchCard(),
            ),
            leadingWidth: 50,
            titleSpacing: 0,
            actions: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  padding: const EdgeInsets.only(left: 0),
                  iconSize: 30,
                  onPressed: () {
                    startSearch("");
                  },
                  visualDensity: VisualDensity.compact,
                  icon: Icon(Icons.shopping_cart_rounded,
                      color: AppColors.mainColor),
                  tooltip: AppLang.of(context)!.cart,
                )
                    .badge(
                  color: AppColors.accentColor.withOpacity(0.8),
                      count: 5,
                      textStyle:
                          TextStyle(color: Theme.of(context).shadowColor),
                      limit: false,
                      position: VxBadgePosition.rightTop,
                    )
                    .pOnly(right: 5),
              ),
            ],
          ),
          body: IndexedStack(
            index: widget.currentTab,
            children: pages,
          ),
          bottomNavigationBar: Padding(
            padding:
                const EdgeInsets.only(bottom: 15, left: 10, right: 10, top: 10),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              // clipBehavior: Clip.antiAliasWithSaveLayer,
              child: BottomNavigationBar(
                backgroundColor: Theme.of(context).cardColor.withOpacity(0.5),
                elevation: 5,
                selectedItemColor:
                    Theme.of(context).textSelectionTheme.selectionColor,
                currentIndex: widget.currentTab,
                onTap: (index) {
                  Provider.of<AppState>(context, listen: false).goToTab(index);
                },
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.home_rounded),
                    label: AppLang.of(context)!.discover,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.live_tv_rounded),
                    label: AppLang.of(context)!.live,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.manage_accounts_rounded),
                    label: AppLang.of(context)!.account,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.settings_rounded),
                    label: AppLang.of(context)!.settings,
                  ),
                ],
              ),
            ),
          ),
          drawer: Padding(
            padding: const EdgeInsets.only(
              top: 80.0,
              bottom: 1.5,
              left: 0.0,
              right: 10,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(10),
              ),
              child: Drawer(
                elevation: 4,
                child: Column(
                  // shrinkWrap: true,
                  children: [
                    /*Drawer header start*/
                    SizedBox(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      child: DrawerHeader(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          margin: const EdgeInsets.only(top: 0.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  AppColors.accentColor.withOpacity(0.5),
                                  AppColors.accentColor.withOpacity(0.8),
                                  AppColors.accentColor,
                                ]),
                            // color: AppColors.accentColor.withOpacity(0.6),
                            image: const DecorationImage(
                              scale: 3,
                              fit: BoxFit.scaleDown,
                              image: AssetImage('assets/logo.png'),
                            ),
                          ),
                          child: const SizedBox()
                          //   Align(
                          //       alignment: Alignment.bottomCenter,
                          //       child: Text(AppLang.of(context)!.quickMenu)),
                          ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    /*Drawer header end*/

                    //Content of the drawer
                    Expanded(
                      child: Stack(
                        children: [
                          /* Body of the drawer start */
                          const DrawerMenuWidget(),
                          /* Body of the drawer end */

                          /* Drawer close button start */
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: FloatingActionButton.small(
                              tooltip: AppLang.of(context)!.close,
                              elevation: 2,
                              backgroundColor: Theme.of(context)
                                  .shadowColor
                                  .withOpacity(0.6),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(Icons.close_rounded),
                            ),
                          ),
                          /* Drawer close button end */
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  ///@Hlabs: Launch the search
  void startSearch(String value) {
    setState(() {
      // clients.clear();
      currentCount = 0;
      currentEndPosition = pageCount;
      currentStartPosition = 0;
      hasMore = true;
      isSearching = true;
      value = value.trim();
    });
  }

  ///@Hlabs: End search
  void endSearch() {
    setState(() {
      isSearching = false;
      searchTextController.clear();
    });
  }

  ///@Hlabs: Search box
  Widget _buildSearchCard() {
    return Card(
      elevation: 0.5,
      color: Theme.of(context).cardColor.withOpacity(0.5),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10.0),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AppLang.of(context)!.search,
                    ),
                    autofocus: false,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      setState(() {
                        searchTextController.text = value;
                      });
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        searchTextController.text = value;
                      });
                    },
                    // controller: searchTextController,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 6.0,
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              startSearch(searchTextController.text);
              final currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            tooltip: AppLang.of(context)!.search,
          ),
        ],
      ),
    );
  }
}
