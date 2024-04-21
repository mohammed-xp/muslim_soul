import 'package:flutter/material.dart';
import 'package:muslim_soul/features/onboarding/presentation/widgets/onboarding_view_body.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: OnboardingViewBody(),
      ),
    );
  }
}
