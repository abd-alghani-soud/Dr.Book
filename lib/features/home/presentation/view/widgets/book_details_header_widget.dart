import 'package:bookly_app/core/utils/style.dart';
import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/book_rating_widget.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/card_item_list_view_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsHeaderWidget extends StatelessWidget {
  final BookModel book;

  const BookDetailsHeaderWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200.w,
          child: CardItemListViewHomeWidget(
            imageUrl: book.volumeInfo.imageLinks.thumbnail,
          ),
        ),
        SizedBox(height: 35.h),
        Text(
          book.volumeInfo.title,
          style: Style.textSize26,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 6.h),
        Opacity(
          opacity: 0.5,
          child: Text(
            book.volumeInfo.authors[0],
            style: Style.textSize18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 14.h),
        BookRatingWidget(mainAxisAlignment: MainAxisAlignment.center),
      ],
    );
  }
}
