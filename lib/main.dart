import 'package:bookly_app/core/constants/strings.dart';
import 'package:bookly_app/core/services/dependecies.dart';
import 'package:bookly_app/core/services/shared_preferences_service.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();
  configureDependencies();
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
      child: SafeArea(
        top: false,
        child: MaterialApp.router(
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Strings.kBackground,
            textTheme: GoogleFonts.montserratTextTheme(
              ThemeData.dark().textTheme,
            ),
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
