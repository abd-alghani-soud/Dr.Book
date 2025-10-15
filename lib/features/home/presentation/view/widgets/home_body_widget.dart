import 'package:bookly_app/core/utils/style.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_app_bar_home_widget.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_list_view_best_seller_widget.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_list_view_home_widget.dart';
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
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                CustomAppBarHomeWidget(),
                SizedBox(height: 28.h),
                CustomListViewHomeWidgets(),
                SizedBox(height: 22.h),
                Text('Best Seller', style: Style.textSize22),
                SizedBox(height: 18.h),
              ],
            ),
          ),
          SliverToBoxAdapter(child: CustomListViewBestSellerWidget()),
        ],
      ),
    );
  }
}
