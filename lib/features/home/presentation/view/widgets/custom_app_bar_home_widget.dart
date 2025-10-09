import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants/assets.dart';

class CustomAppBarHomeWidget extends StatelessWidget {
  const CustomAppBarHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(Assets.kIcon, height: 55.h),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(FontAwesomeIcons.magnifyingGlass),
        ),
      ],
    );
  }
}
