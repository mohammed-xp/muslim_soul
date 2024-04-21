import 'package:go_router/go_router.dart';
import 'package:muslim_soul/features/main/presentation/main_view.dart';
import 'package:muslim_soul/features/onboarding/presentation/onboarding_view.dart';
import 'package:muslim_soul/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kMainView = '/mainView';
  static const kOnboardingView = '/onboardingView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kMainView,
        builder: (context, state) => const MainView(),
      ),
    ],
  );
}
