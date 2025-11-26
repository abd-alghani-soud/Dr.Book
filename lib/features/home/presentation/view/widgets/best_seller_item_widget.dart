import 'package:bookly_app/core/constants/assets.dart';
import 'package:bookly_app/core/constants/strings.dart';
import 'package:bookly_app/core/utils/style.dart';
import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/book_rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BestSellerItemWidgets extends StatelessWidget {
  const BestSellerItemWidgets({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/bookDetailsPage');
      },
      child: SizedBox(
        height: 135,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.4 / 4.1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.sp),
                child: CachedNetworkImage(
                  imageUrl: book.volumeInfo.imageLinks.thumbnail,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(size: 60, Icons.error_outline)),
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
                      book.volumeInfo.title,
                      style: Style.textSize22.copyWith(
                        fontFamily: Strings.kLibreBaskerville,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    book.volumeInfo.authors[0],
                    style: Style.textSize16,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        r'free 0.0 $',
                        style: Style.textSize18.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(flex: 1),
                      BookRatingWidget(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
