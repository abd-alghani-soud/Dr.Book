import 'package:flutter/material.dart';

class CustomBookDetailsAppbar extends StatelessWidget {
  const CustomBookDetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.close, size: 32)),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart_outlined, size: 32),
        ),
      ],
    );
  }
}
