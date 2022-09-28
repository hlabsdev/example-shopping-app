import 'package:assigame_market/logic/managers/app_router.dart';
import 'package:assigame_market/logic/managers/managers.dart';
import 'package:assigame_market/ui/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Slide {
  final ImageProvider image;
  final String text;

  Slide(this.image, this.text);
}

class SliderScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: AppPages.slider,
      key: ValueKey(AppPages.slider),
      child: const SliderScreen(),
    );
  }

  const SliderScreen({Key? key}) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  final controller = PageController();
  int current = 0;

  @override
  Widget build(BuildContext context) {
    List<Slide> sliderList = [
      Slide(
        const AssetImage('assets/slider/1.png'),
        AppLang.of(context)!.sliderOne,
      ),
      Slide(
        const AssetImage('assets/slider/2.png'),
        AppLang.of(context)!.sliderTwo,
      ),
      Slide(
        const AssetImage('assets/slider/3.png'),
        AppLang.of(context)!.sliderThree,
      ),
      Slide(
        const AssetImage('assets/slider/4.png'),
        AppLang.of(context)!.sliderFour,
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: sliderList[current].image,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.chevron_left_rounded,
                      size: 35,
                      color: AppColors.assigameWhite.withOpacity(0.7),
                    ),
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                  ),
                  const SizedBox(width: 25),
                  Text(AppLang.of(context)!.welcome,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColors.assigameWhite.withOpacity(0.7),
                          )),
                ],
              ),
            ),
            Expanded(child: buildPages(sliderList)),
            const SizedBox(height: 8),
            buildIndicator(),
            buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildActionButtons() {
    return Column(
      children: [
        /*Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text(
                "<<" + AppLang.of(context)!.previous,
                style: TextStyle(
                  color: AppColors.assigameYellow,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                setState(() {
                  controller.previousPage(
                      duration: const Duration(microseconds: 500),
                      curve: Curves.easeInOut);
                });
              },
            ),
            TextButton(
              child: Text(
                AppLang.of(context)!.next + ">>",
                style: TextStyle(
                  color: AppColors.assigameYellow,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                setState(() {
                  controller.nextPage(
                      duration: const Duration(microseconds: 500),
                      curve: Curves.easeInOut);
                });
              },
            ),
          ],
        ),*/
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text(
                  AppLang.of(context)!.skip,
                  style: TextStyle(
                    color: AppColors.assigameWhite
                        .withOpacity(0.8), //.withOpacity(0.8),
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Provider.of<AppState>(context, listen: false)
                      .completeSlider();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPages(List<Slide> sliderList) {
    return PageView(
      controller: controller,
      onPageChanged: (index) {
        setState(() {
          controller.animateToPage(index,
              duration: const Duration(microseconds: 750),
              curve: Curves.easeInOutCubic);
          current = index;
        });
      },
      children: List.generate(
        sliderList.length,
        (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 320),
              SizedBox(
                height: 150,
                child: Image(
                  image: const AssetImage('assets/icon.png'),
                  color: AppColors.accentColor,
                ),
              ),
              // const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  sliderList[index].text,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.accentColor.withOpacity(0.9),
                        // color: AppColors.assigameBlack.withOpacity(0.9),
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
/*
  */ /*Widget*/ /* onboardPageView(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 1.5),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Theme.of(context).cardColor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
      ],
    );
  }*/

  Widget buildIndicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: 4,
      onDotClicked: (index) {
        setState(() {
          controller.animateToPage(index,
              duration: const Duration(microseconds: 750),
              curve: Curves.easeInOut);
          current = index;
        });
      },
      effect: WormEffect(activeDotColor: AppColors.accentColor),
    );
  }
}
