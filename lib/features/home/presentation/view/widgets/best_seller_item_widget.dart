import 'package:bookly_app/core/constants/assets.dart';
import 'package:bookly_app/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookly_app/core/constants/strings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BestSellerItemWidgets extends StatelessWidget {
  const BestSellerItemWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.4 / 4.1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.sp),
                image: DecorationImage(
                  image: const AssetImage(Assets.onboarding1),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 230.w,
                  child: Text(
                    'Harry Potter and the Goblet of Fire',
                    style: Style.textSize22.copyWith(
                      fontFamily: Strings.kLibreBaskerville,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 3),
                const Text('J.K.Rowling', style: Style.textSize16),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      r'19.99 $',
                      style: Style.textSize18.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(flex: 1),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.solidStar,
                          color: Color(0xffFFDD4F),
                        ),
                        const SizedBox(width: 6.5),
                        const Text('4.8', style: Style.textSize18),
                        const SizedBox(width: 5),
                        Text(
                          '(1435)',
                          style: Style.textSize16.copyWith(
                            color: const Color(0xff707070),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
