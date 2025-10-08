import 'package:bookly_app/core/constants/strings.dart';
import 'package:bookly_app/features/splash_intro/view/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      enableScaleText: () => false,
      fontSizeResolver: (fontSize, instance) {
        return fontSize.toDouble();
      },
      designSize: const Size(414, 930),
      child: GetMaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Strings.kBackground,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}
