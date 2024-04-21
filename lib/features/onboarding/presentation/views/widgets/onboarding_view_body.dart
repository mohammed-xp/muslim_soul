import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:muslim_soul/core/utils/assets.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  static List<PageViewModel> pages = [
    PageViewModel(
      title: "Read Quran",
      bodyWidget: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Customize your reading view, read in multiple language, listen different audio',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      image: Center(
        child: Image.asset(
          AssetsData.quranImage,
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
    PageViewModel(
      title: "Prayer Alerts",
      bodyWidget: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Choose your adhan, which prayer to be notification of and how often',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      image: Center(
        child: Image.asset(
          AssetsData.prayerImage,
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
    PageViewModel(
      title: "Build Better Habits",
      bodyWidget: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Make islamic Practices a part of your daily life in a way that best suits your life',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      image: Center(
        child: Image.asset(
          AssetsData.zakatImage,
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages,
      // showSkipButton: true,
      // skip: const Icon(Icons.skip_next),
      showNextButton: true,
      next: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.black,
      ),
      done: const Text(
        "Done",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      onDone: () {
        GoRouter.of(context).push(AppRouter.kMainView);
      },
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Constants.kPrimary,
        color: Colors.grey,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}
