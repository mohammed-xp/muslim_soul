import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim_soul/constants.dart';
import 'package:muslim_soul/core/network/local/cache_helper.dart';
import 'package:muslim_soul/core/utils/app_router.dart';
import 'package:muslim_soul/core/utils/assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    String nextScreen = getNextScreen();

    Timer(
      const Duration(seconds: 3),
      () => GoRouter.of(context).pushReplacement(nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Center(
              child: Text(
                'Muslim Soul',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(AssetsData.islamicImage),
            ),
          ],
        ),
      ),
    );
  }

  String getNextScreen() {
    final bool isShowedOnboarding =
        CacheHelper.getData(key: Constants.kShowOnboarding) ?? false;
    if (isShowedOnboarding) {
      return AppRouter.kMainView;
    } else {
      return AppRouter.kOnboardingView;
    }
  }
}
