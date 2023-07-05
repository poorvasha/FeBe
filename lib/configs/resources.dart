import 'package:flutter/material.dart';

class AppResources {
  static var screenMargin = const EdgeInsets.fromLTRB(20, 30, 20, 30);
  static InputDecorationTheme defaultInputDecoration =
      const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 2, color: AppColors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 2, color: AppColors.white),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 2, color: AppColors.white),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 2, color: AppColors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 2, color: AppColors.red),
          ));
  static InputDecoration bareInputDecoration = const InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide.none,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide.none,
      ));

  static ButtonStyle buttonStyle = const ButtonStyle(
      minimumSize: MaterialStatePropertyAll(Size(double.infinity, 50)),
      backgroundColor: MaterialStatePropertyAll(AppColors.golden));
}

// #region Colors
class AppColors {
  static const Color golden = Color(0xFFEBB61F);
  static const Color lightGolden = Color(0xFFFFFAEC);
  static const Color lightBlack = Color(0xFF1E1E1E);
  static const Color lightWhite = Color(0xFFFFFCF3);
  static const Color linkBlue = Color(0xFF0d99ff);
  static const Color white = Color(0xFfffffff);
  static const Color black = Color(0xFF000000);
  static Color brown = const Color(0xFFFF0000).withOpacity(0.1);
  static const Color gray = Color(0xFF292929);
  static const Color lightGray = Color(0xFF49454F);
  static const Color red = Color(0xFFDB4437);
  static const Color green = Color(0xFF0F9D58);
  static const Color goldenTint = Color(0xFFFFEAAF);
  static const Color darkGolden = Color(0xFFF4B400);

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
        color: AppColors.golden.withOpacity(0.20),
        spreadRadius: 0,
        offset: const Offset(0, 4),
        blurRadius: 4,
        blurStyle: BlurStyle.normal),
  ];
}
// #endregion

