import 'package:bookly_app/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CardItemListViewHomeWidget extends StatelessWidget {
  const CardItemListViewHomeWidget({super.key, required this.imageUrl});
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/bookDetailsPage');
      },
      child: AspectRatio(
        aspectRatio: 2.7 / 4.5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.sp),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
