import 'package:flutter/material.dart';
import '../app_colors.dart';

class ConstructorTextStyle {
  static const TextStyle inputText = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
      color: AppColors.darkGreyColor);

  static TextStyle lable = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGreyColor.withOpacity(0.4),
  );
  static TextStyle snackBar = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.yellowColor,
  );
}
