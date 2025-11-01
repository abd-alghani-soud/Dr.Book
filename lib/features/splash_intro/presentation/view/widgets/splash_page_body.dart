import 'package:bookly_app/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashPageBody extends StatelessWidget {
  const SplashPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(Assets.kLogo, width: 410.w, height: 410.h)
              .animate(
                onComplete: (controller) {
                  controller.repeat(count: 2).then((v) {
                    GoRouter.of(context).push('/onboardingPage');
                    // Get.off(
                    //   () => const OnboardingPage(),
                    //   transition: Transition.fade,
                    //   duration: Strings.kTransitionDuration,
                    // );
                    // Get.offAll(() => const OnboardingPage());
                  });
                },
              )
              .fadeIn(duration: Durations.extralong2)
              .fadeOut(delay: Durations.extralong2, duration: Durations.long3),
        ],
      ),
    );
  }
}
