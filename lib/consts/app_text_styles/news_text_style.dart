import 'package:flutter/material.dart';
import '../app_colors.dart';

class NewsTextStyle {
  static const TextStyle title = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static TextStyle preview = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 14.0,
    height: 18 / 12,
    fontWeight: FontWeight.w400,
    color: Colors.white.withOpacity(0.5),
  );
  static const TextStyle business = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 14.0,
    height: 18 / 12,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static const TextStyle read = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 12.0,
    height: 18 / 12,
    fontWeight: FontWeight.w400,
    //   color: AppColors.orangeColor,
  );
  static const TextStyle articleTitle = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 24.0,
    height: 20 / 18,
    fontWeight: FontWeight.w700,
    color: AppColors.darkGreyColor,
  );
  static const TextStyle articleText = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 16.0,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}
