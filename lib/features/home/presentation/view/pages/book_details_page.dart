import 'package:bookly_app/core/utils/style.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/book_rating_widget.dart';
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
            const SizedBox(height: 35),
            Text('The Jungle Book', style: Style.textSize26),
            const SizedBox(height: 6),
            Opacity(
              opacity: 0.5,
              child: Text(
                'Rudyard Kipling',
                style: Style.textSize18.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 16),
            BookRatingWidget(mainAxisAlignment: MainAxisAlignment.center),
          ],
        ),
      ),
    );
  }
}
