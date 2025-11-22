import 'package:bookly_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class FailedWidget extends StatelessWidget {
  const FailedWidget({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage, style: Style.textSize18));
  }
}
