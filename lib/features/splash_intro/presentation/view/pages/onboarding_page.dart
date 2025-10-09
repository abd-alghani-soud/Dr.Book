import 'package:bookly_app/core/constants/strings.dart';
import 'package:bookly_app/features/home/presentation/view/pages/home_page.dart';
import 'package:bookly_app/features/splash_intro/data/models/onboarding_model.dart';
import 'package:bookly_app/features/splash_intro/presentation/view/widgets/bottom_controls.dart';
import 'package:bookly_app/features/splash_intro/presentation/view/widgets/onboard_page_content.dart';
import 'package:bookly_app/features/splash_intro/presentation/view/widgets/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/assets.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;
  late final ValueNotifier<int> _currentPage;

  final List<OnboardModel> _pages = [
    OnboardModel(
      image: Assets.onboarding1,
      title: 'Get free books to read',
      subtitle: 'Access a vast library of free books at your fingertips.',
    ),
    OnboardModel(
      image: Assets.onboarding2,
      title: 'Discover new authors',
      subtitle:
          'Find new authors and ratings to help you choose your next book.',
    ),
    OnboardModel(
      image: Assets.onboarding3,
      title: 'Organize your library',
      subtitle:
          'Organize your books, create reading lists, and track your progress.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentPage = ValueNotifier<int>(0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPage.dispose();
    super.dispose();
  }

  void _finishOnboarding() {
    Get.offAll(
      () => const HomePage(),
      transition: Transition.fadeIn,
      duration: Strings.kTransitionDuration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff3a3555),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SkipButton(onSkip: _finishOnboarding),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) => _currentPage.value = index,
                  itemBuilder: (context, index) {
                    final p = _pages[index];
                    return OnboardPageContent(
                      model: p,
                      spriteIndex: index,
                      total: _pages.length,
                    );
                  },
                ),
              ),
              BottomControls(
                pageCount: _pages.length,
                currentPage: _currentPage,
                onNext: () {
                  final isLast = _currentPage.value == _pages.length - 1;
                  if (isLast) {
                    _finishOnboarding();
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
