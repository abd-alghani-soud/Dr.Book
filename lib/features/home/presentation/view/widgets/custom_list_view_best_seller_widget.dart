import 'package:bookly_app/features/home/presentation/view/widgets/best_seller_item_widget.dart';
import 'package:flutter/material.dart';

class CustomListViewBestSellerWidget extends StatelessWidget {
  const CustomListViewBestSellerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 7,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: BestSellerItemWidgets(),
        );
      },
    );
  }
}
