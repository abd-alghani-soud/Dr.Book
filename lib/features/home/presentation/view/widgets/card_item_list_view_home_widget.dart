import 'package:bookly_app/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardItemListViewHomeWidget extends StatelessWidget {
  const CardItemListViewHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.sp),
          image: DecorationImage(
            image: AssetImage(Assets.onboarding1),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
