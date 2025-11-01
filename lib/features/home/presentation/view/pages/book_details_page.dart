import 'package:bookly_app/features/home/presentation/view/widgets/card_item_list_view_home_widget.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_book_details_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            SafeArea(child: CustomBookDetailsAppbar()),
            const SizedBox(height: 10),
            SizedBox(width: 200.w, child: CardItemListViewHomeWidget()),
          ],
        ),
      ),
    );
  }
}
