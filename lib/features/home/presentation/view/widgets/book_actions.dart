import 'package:bookly_app/core/widgets/custom_actions_button.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key});

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
            backgroundColor: WidgetStatePropertyAll(Color(0xffe57864)),
            text: 'Free Preview',
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
}

