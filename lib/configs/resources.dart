import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppResources {
  static var screenMargin = const EdgeInsets.fromLTRB(20, 30, 20, 30);
}

// #region Colors
class AppColors {
  static const Color golden = Color(0xFFE5B369);
  static const Color lightBlack = Color(0xFF121212);
  static const Color lightWhite = Color(0xFFE0E0E0);
  static const Color linkBlue = Color(0xFF0d99ff);
  static const Color white = Color(0xFfffffff);
  static const Color black = Color(0xFF000000);
  static Color brown = const Color(0xFFFF0000).withOpacity(0.1);
  static const Color gray = Color(0xFF292929);
  static const Color red = Color(0xFFDB4437);
  static const Color green = Color(0xFF0F9D58);
}
// #endregion

// #region TextStyles
class AppTextStyles {
  static TextStyle extraBoldBeVietnamPro = const TextStyle(
      fontFamily: 'BeVietnamPro', fontSize: 14, fontWeight: FontWeight.w800);

  static TextStyle boldBeVietnamPro = const TextStyle(
      fontFamily: 'BeVietnamPro', fontSize: 30, fontWeight: FontWeight.w700);

  static TextStyle semiBoldBeVietnamPro12 = const TextStyle(
      fontFamily: 'BeVietnamPro', fontSize: 12, fontWeight: FontWeight.w600);

  static TextStyle semiBoldBeVietnamPro16 = const TextStyle(
      fontFamily: 'BeVietnamPro', fontSize: 16, fontWeight: FontWeight.w600);

  static TextStyle semiBoldBeVietnamPro20 = const TextStyle(
      fontFamily: 'BeVietnamPro', fontSize: 20, fontWeight: FontWeight.w600);

  static TextStyle mediumBeVietnamPro = const TextStyle(
      fontFamily: 'BeVietnamPro', fontSize: 12, fontWeight: FontWeight.w500);

  static TextStyle regularBeVietnamPro12 = const TextStyle(
      fontFamily: 'BeVietnamPro', fontSize: 12, fontWeight: FontWeight.w400);

  static TextStyle regularBeVietnamPro16 = const TextStyle(
      fontFamily: 'BeVietnamPro', fontSize: 16, fontWeight: FontWeight.w400);

  static TextStyle regularBeVietnamPro20 = const TextStyle(
      fontFamily: 'BeVietnamPro', fontSize: 20, fontWeight: FontWeight.w400);

  static TextStyle regularBeVietnamPro24 = const TextStyle(
      fontFamily: 'BeVietnamPro', fontSize: 24, fontWeight: FontWeight.w400);

  static TextStyle regularBeVietnamPro30 = const TextStyle(
      fontFamily: 'BeVietnamPro', fontSize: 30, fontWeight: FontWeight.w400);
}
// #endregion

// #region Shadows
class AppShaddows {
  static List<BoxShadow> customShadow = [
    BoxShadow(
        color: AppColors.white.withOpacity(0.15),
        spreadRadius: 0,
        offset: const Offset(4, 4),
        blurRadius: 8,
        blurStyle: BlurStyle.normal),
    BoxShadow(
        color: AppColors.white.withOpacity(0.60),
        spreadRadius: 0,
        offset: const Offset(-4, -4),
        blurRadius: 4,
        blurStyle: BlurStyle.normal)
  ];
}
// #endregion

