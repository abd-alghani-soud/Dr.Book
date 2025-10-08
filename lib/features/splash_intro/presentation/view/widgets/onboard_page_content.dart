import 'package:bookly_app/features/splash_intro/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardPageContent extends StatelessWidget {
  final OnboardModel model;
  final int spriteIndex;
  final int total;

  const OnboardPageContent({
    required this.model,
    required this.spriteIndex,
    required this.total,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 360.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(
              model.image,
              fit: BoxFit.cover,
              width: 350.w,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.white12,
                  alignment: Alignment.center,
                  child: Icon(Icons.image_not_supported, size: 48.r, color: Colors.white30),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 28.h),
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            model.subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white70,
            ),
          ),
        ),
      ],
    );
  }
}
