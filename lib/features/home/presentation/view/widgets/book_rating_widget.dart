import 'package:bookly_app/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRatingWidget extends StatelessWidget {
  const BookRatingWidget({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(FontAwesomeIcons.solidStar, color: Color(0xffFFDD4F),size: 18,),
        const SizedBox(width: 7),
        const Text('4.8', style: Style.textSize18),
        const SizedBox(width: 7),
        Opacity(opacity: 0.7,
          child: Text(
            '(1435)',
            style: Style.textSize16.copyWith(),
          ),
        ),
      ],
    );
  }
}
