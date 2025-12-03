import 'package:bookly_app/core/widgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        // GoRouter.of(context).push('/bookDetailsPage');
      },
      child: AspectRatio(
        aspectRatio: 2.6 / 4.2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.sp),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) =>
                Center(child: Icon(size: 60, Icons.error_outline)),
            placeholder: (context, url) => LoadingWidget(ok: false),
          ),
        ),
      ),
    );
  }
}
