import 'package:bookly_app/core/widgets/custom_actions_button.dart';
import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomActionsButton(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            text: r'19.99 $',
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: CustomActionsButton(
            onPressed: () async {
              Uri url = Uri.parse(book.volumeInfo.previewLink);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            backgroundColor: WidgetStatePropertyAll(Color(0xffe57864)),
            text: getText(book),
            textColor: Colors.white,
            fontSize: 16,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }

  String getText(BookModel book){
    if((book.volumeInfo?.previewLink == null)){
      return 'not Available';
    }
    else {
       return 'Free Preview';
    }
  }
}
