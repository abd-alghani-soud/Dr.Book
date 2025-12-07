import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/book_actions_section_widget.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/book_description_widget.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/book_details_header_widget.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/similar_books_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsBody extends StatelessWidget {
  final BookModel book;

  const BookDetailsBody({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomBookDetailsAppbar(),
          SizedBox(height: 10.h),
          BookDetailsHeaderWidget(book: book),
          SizedBox(height: 35.h),
          BookActionsSectionWidget(book: book),
          SizedBox(height: 45.h),
          SimilarBooksSectionWidget(book: book),
          SizedBox(height: 35.h),
          BookDescriptionWidget(description: book.volumeInfo.description),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
