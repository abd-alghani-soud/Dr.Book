import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/pages/book_details_page.dart';
import 'package:bookly_app/features/home/presentation/view/pages/home_page.dart';
import 'package:bookly_app/features/search/presentation/view/pages/search_page.dart';
import 'package:bookly_app/features/splash_intro/presentation/view/pages/onboarding_page.dart';
import 'package:bookly_app/features/splash_intro/presentation/view/pages/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      /// Splash
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),

      /// Onboarding
      GoRoute(
        path: '/onboardingPage',
        builder: (context, state) => const OnboardingPage(),
      ),

      /// Home
      GoRoute(
        path: '/homePage',
        builder: (context, state) => const HomePage(),
      ),

      /// Search
      GoRoute(
        path: '/searchPage',
        builder: (context, state) => const SearchPage(),
      ),

      /// Book Details
      GoRoute(
        path: '/bookDetailsPage',
        builder: (context, state) {
          // --- Validation لمنع الكراش ---
          if (state.extra == null || state.extra is! BookModel) {
            return Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: Text(
                  "No book data was provided!",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          }

          // --- Safe Casting ---
          final book = state.extra as BookModel;

          return BookDetailsPage(book: book);
        },
      ),
    ],
  );
}
