import 'package:bookly_app/features/home/presentation/view/widgets/book_actions.dart';
import 'package:flutter/material.dart';

class BookActionsSectionWidget extends StatelessWidget {
  const BookActionsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: BookActions(),
    );
  }
}
