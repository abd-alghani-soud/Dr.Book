import 'package:bookly_app/features/home/presentation/view/widgets/book_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:bookly_app/features/home/presentation/controller/cubits/home_cubit.dart';
import 'package:bookly_app/core/services/dependecies.dart';

class BookDetailsPage extends StatefulWidget {
  final BookModel book;

  const BookDetailsPage({super.key, required this.book});

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  @override
  void initState() {
    super.initState();

    final category = (widget.book.volumeInfo.categories.isNotEmpty)
        ? widget.book.volumeInfo.categories[0]
        : '';

    getIt<HomeCubit>().getSimilarBooks(category: category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: BookDetailsBody(book: widget.book),
        ),
      ),
    );
  }
}
