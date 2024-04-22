import 'package:go_router/go_router.dart';
import 'package:muslim_soul/features/main/presentation/views/main_view.dart';
import 'package:muslim_soul/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:muslim_soul/features/quran/presentation/views/juz_view.dart';
import 'package:muslim_soul/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kMainView = '/mainView';
  static const kOnboardingView = '/onboardingView';
  static const kJuzView = '/juzView';

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
      GoRoute(
        path: kJuzView,
        builder: (context, state) => const JuzView(),
      ),
    ],
  );
}
