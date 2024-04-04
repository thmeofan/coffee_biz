import 'package:flutter/material.dart';
import '../app_colors.dart';

class HomeScreenTextStyle {
  static const TextStyle bannerTitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
  static const TextStyle bannerAmount = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    //  color: Colors.white,
  );
  static TextStyle title = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle appbar = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: AppColors.yellowColor,
  );
  static const TextStyle name = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: AppColors.darkGreyColor);
  static const TextStyle detail = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: AppColors.darkGreyColor);
  static TextStyle description = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.darkGreyColor.withOpacity(0.4));
  static TextStyle descriptionAmount = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.black);
  static const TextStyle typeBad = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: AppColors.redColor);
  static const TextStyle goods = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static const TextStyle location = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.grey);
  static TextStyle info = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.w300,
    color: AppColors.yellowColor,
  );
  static TextStyle emptyTitle = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    color: AppColors.yellowColor,
  );
  static TextStyle emptySubtitle = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.w200,
    color: Colors.white,
  );
}
