import 'package:bookly_app/core/utils/style.dart';
import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/details_list_view_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarBooksSectionWidget extends StatelessWidget {
  final BookModel book;

  const SimilarBooksSectionWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Style.textSize16.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 16.h),
        DetailsListViewWidgets(
          imageUrl: book.volumeInfo.imageLinks.thumbnail,
        ),
      ],
    );
  }
}
