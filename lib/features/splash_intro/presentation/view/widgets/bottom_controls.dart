import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomControls extends StatelessWidget {
  final int pageCount;
  final ValueNotifier<int> currentPage;
  final VoidCallback onNext;

  const BottomControls({
    super.key,
    required this.pageCount,
    required this.currentPage,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h, top: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ValueListenableBuilder<int>(
            valueListenable: currentPage,
            builder: (context, value, _) {
              return Row(
                children: List.generate(pageCount, (index) {
                  final isActive = index == value;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                    width: isActive ? 22.w : 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: isActive ? Colors.white : Colors.white54,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  );
                }),
              );
            },
          ),
          ValueListenableBuilder<int>(
            valueListenable: currentPage,
            builder: (context, value, _) {
              final isLast = value == pageCount - 1;
              return ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 10.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  isLast ? 'Get Started' : 'Next',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xff0a1126),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
