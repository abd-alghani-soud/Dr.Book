import 'package:bookly_app/features/home/presentation/view/widgets/custom_app_bar_home_widget.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_list_view_home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.w,
        right: 18.w,
        top: 50.h,
        bottom: 20.h,
      ),
      child: Column(
        children: [
          CustomAppBarHomeWidget(),
          SizedBox(height: 28.h),
          CustomListViewHomeWidgets(),
        ],
      ),
    );
  }
}
