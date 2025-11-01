import 'package:bookly_app/core/constants/strings.dart';
import 'package:flutter/material.dart';

abstract class Style {
  static const textSize22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
  static const textSize20 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );
  static const textSize24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
  );
  static const textSize16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static const textSize18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textSize26 = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    fontFamily: Strings.kLibreBaskerville,
  );
}
