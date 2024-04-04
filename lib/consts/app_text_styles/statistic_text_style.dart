import 'package:flutter/material.dart';
import '../app_colors.dart';

class StatisticTextStyle {
  static const TextStyle name = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    color: AppColors.darkGreyColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle bottomTitle = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle inputText = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
      color: AppColors.darkGreyColor);
  static const TextStyle appBar = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.greenColor);

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
