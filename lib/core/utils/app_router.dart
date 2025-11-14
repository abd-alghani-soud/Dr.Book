import 'package:bookly_app/features/home/presentation/view/pages/book_details_page.dart';
import 'package:bookly_app/features/home/presentation/view/pages/home_page.dart';
import 'package:bookly_app/features/search/presentation/view/pages/search_page.dart';
import 'package:bookly_app/features/splash_intro/presentation/view/pages/onboarding_page.dart';
import 'package:bookly_app/features/splash_intro/presentation/view/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashPage()),
      GoRoute(
        path: '/onboardingPage',
        builder: (context, state) => OnboardingPage(),
      ),
      GoRoute(path: '/homePage', builder: (context, state) => HomePage()),
      GoRoute(path: '/searchPage', builder: (context, state) => SearchPage()),
      GoRoute(
        path: '/bookDetailsPage',
        builder: (context, state) => BookDetailsPage(),
      ),
    ],
  );
}
