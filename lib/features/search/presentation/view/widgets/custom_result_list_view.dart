import 'package:flutter/material.dart';

class CustomResultListView extends StatelessWidget {
  const CustomResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 7,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child:Text('data'),
          // BestSellerItemWidgets(),
        );
      },
    );
  }
}
