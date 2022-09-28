import 'package:assigame_market/logic/managers/managers.dart';
import 'package:assigame_market/ui/styles/app_colors.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  final List<String> categoryList = [
    "Clothing",
    "Edge",
    "Household",
    "Electronic",
    "Cosmetic",
    "Beauty",
    "Alimentation",
    "Medical",
    "Medical",
    "Entertainement",
    "Music",
    "Miscelanious",
  ];

  late TabController categTabController;
  late SliverGridDelegate gridDelegate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // categTabController = TabController(length: categoryList.length, vsync: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        children: [
          // Sliders cards
          SizedBox(
            // height: MediaQuery.of(context).size.height / 3.5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              // child: buildProductCarousel(),
              child: buildProductCustomCarousel(),
            ),
          ),
          const SizedBox(height: 5),

          // Categories tabs
          DefaultTabController(
            length: categoryList.length,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                children: [
                  TabBar(
                    isScrollable: true,
                    labelColor: Theme.of(context).textTheme.caption!.color,
                    // controller: categTabController,
                    tabs: List.generate(categoryList.length, (index) {
                      return Tab(
                        text: categoryList[index],
                      );
                    }),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                        children: List.generate(categoryList.length, (index) {
                      return buildProductInfiniteGridView();
                    })),
                  ),
                ],
              ),
            ),
          ),

          // SizedBox(
          //   height: 60,
          //   child: ListView.builder(
          //       shrinkWrap: true,
          //       scrollDirection: Axis.horizontal,
          //       itemCount: categoryList.length,
          //       cacheExtent: 3,
          //       clipBehavior: Clip.hardEdge,
          //       itemBuilder: (context, li) {
          //         return buildCategoryTab(li);
          //       }),
          // ),
          const SizedBox(height: 10),

          // Grid list of products  (First all, and then by category when selected)
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 10.0),
          //   child: Text("PRODUCTS",
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
          // ),
          // //TODO: If possible implement infinite scrolling here
          // buildProductInfiniteGridView(),
        ],
      ),
    );
  }

  GridView buildProductInfiniteGridView() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      childAspectRatio: 0.66,
      // shrinkWrap: true,
      // physics: const AlwaysScrollableScrollPhysics(),
      // physics: const NeverScrollableScrollPhysics(),
      primary: false,
      scrollDirection: Axis.vertical,
      children: List.generate(
        imageList.length,
        (gi) {
          return Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            color: Theme.of(context).cardColor,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 5.0),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageList[gi]),
                        fit: BoxFit.cover,
                        scale: 0.2,
                      ),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15.0),
                        bottom: Radius.circular(0.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "450\$",
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              //TODO: Implement wholepage dialog to sjow the sproduct
                            },
                            child: Text("voir plus...",
                                style:
                                    TextStyle(color: AppColors.assigameBlue))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildCategoryTab(int li) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 50,
        maxWidth: 150,
        // minHeight: 50,
        // minWidth: 75,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
        child: Card(
          // margin: const EdgeInsets.all(8),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Center(
              child: Text(
            categoryList[li],
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }

  Widget buildProductCustomCarousel() {
    return GFCarousel(
      autoPlay: true,
      hasPagination: true,
      viewportFraction: 1.0,
      aspectRatio: 2,
      items: imageList.map((url) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(url, fit: BoxFit.cover, width: 1000.0),
          ),
        );
      }).toList(),
    );
  }
}

//
