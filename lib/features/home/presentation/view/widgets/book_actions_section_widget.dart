import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/book_actions.dart';
import 'package:flutter/material.dart';

class BookActionsSectionWidget extends StatelessWidget {
  const BookActionsSectionWidget({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: BookActions(book:book ,),
    );
  }
}
