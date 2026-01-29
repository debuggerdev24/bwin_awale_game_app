import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  AppTextStyles._();

  // SF Pro Display Styles
  static TextStyle poppinsDisplayRegular({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400,
      fontSize: fontSize?.sp ?? 16.sp,
      color: color,
    );
  }

  static TextStyle poppinsDisplayMedium({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: 'poppins',
      fontWeight: FontWeight.w500,
      fontSize: fontSize?.sp ?? 18.sp,
      color: color,
    );
  }

  static TextStyle poppinsDisplaySemibold({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: 'poppins',
      fontWeight: FontWeight.w600,
      fontSize: fontSize?.sp ?? 16.sp,
      color: color,
    );
  }

  static TextStyle sfProDisplayBold({
    double? fontSize,
    Color? color,
    TextDecoration? decoration,
    double letterSpacing = 0.0,
  }) {
    return TextStyle(
      fontFamily: 'poppins',
      fontWeight: FontWeight.w700,
      fontSize: fontSize?.sp ?? 16.sp,
      color: color,
      decoration: decoration,
      letterSpacing: letterSpacing,
    );
  } 
   static TextStyle sfProTextLight({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: 'poppins',
      fontWeight: FontWeight.w300,
      fontSize: fontSize?.sp ?? 12.sp,
      color: color,
    );
  }

  // SF Pro Text Styles
  static TextStyle sfProTextRegular({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400,
      fontSize: fontSize?.sp ?? 16.sp,
      color: color,
    );
  }

  static TextStyle sfProTextMedium({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: 'poppins',
      fontWeight: FontWeight.w500,
      fontSize: fontSize?.sp ?? 16.sp,
      color: color,
    );
  }

  static TextStyle sfProTextSemibold({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: 'poppins',
      fontWeight: FontWeight.w600,
      fontSize: fontSize?.sp ?? 16.sp,
      color: color,
    );
  }

  static TextStyle sfProTextBold({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: 'poppins',
      fontWeight: FontWeight.w700,
      fontSize: fontSize?.sp ?? 16.sp,
      color: color,
    );
  }

  static TextStyle get textStyle12Regular =>
      poppinsDisplayRegular(fontSize: 12.sp);
  static TextStyle get textStyle14Regular =>
      poppinsDisplayRegular(fontSize: 14.sp);
  static TextStyle get textStyle14Medium =>
      poppinsDisplayMedium(fontSize: 14.sp);
  static TextStyle get textStyle14Semibold =>
      poppinsDisplaySemibold(fontSize: 14.sp);
  static TextStyle get textStyle14Bold => sfProDisplayBold(fontSize: 14.sp);

  static TextStyle get textStyle16Regular =>
      poppinsDisplayRegular(fontSize: 16.sp);
  static TextStyle get textStyle16Medium =>
      poppinsDisplayMedium(fontSize: 16.sp);
  static TextStyle get textStyle16Semibold =>
      poppinsDisplaySemibold(fontSize: 16);
  static TextStyle get textStyle16Bold => sfProDisplayBold(fontSize: 16.sp);

  static TextStyle get textStyle18Regular =>
      poppinsDisplayRegular(fontSize: 18.sp);
  static TextStyle get textStyle18Medium =>
      poppinsDisplayMedium(fontSize: 18.sp);
  static TextStyle get textStyle18Semibold =>
      poppinsDisplaySemibold(fontSize: 18);
  static TextStyle get textStyle18Bold => sfProDisplayBold(fontSize: 18.sp);

  static TextStyle get textStyle20Regular =>
      poppinsDisplayRegular(fontSize: 20.sp);
  static TextStyle get textStyle20Medium =>
      poppinsDisplayMedium(fontSize: 20.sp);
  static TextStyle get textStyle20Semibold =>
      poppinsDisplaySemibold(fontSize: 20);
  static TextStyle get textStyle20Bold => sfProDisplayBold(fontSize: 20.sp);

  static TextStyle get textStyle24Regular =>
      poppinsDisplayRegular(fontSize: 24.sp);
  static TextStyle get textStyle24Medium =>
      poppinsDisplayMedium(fontSize: 24.sp);
  static TextStyle get textStyle24Semibold =>
      poppinsDisplaySemibold(fontSize: 24.sp);
  static TextStyle get textStyle24Bold => sfProDisplayBold(fontSize: 24.sp);

  static TextStyle get textStyle28Regular =>
      poppinsDisplayRegular(fontSize: 28.sp);
  static TextStyle get textStyle28Medium =>
      poppinsDisplayMedium(fontSize: 28.sp);
  static TextStyle get textStyle28Semibold =>
      poppinsDisplaySemibold(fontSize: 28);
  static TextStyle get textStyle32Bold => sfProDisplayBold(fontSize: 32.sp);
}

class FadePageTransitionsBuilder extends PageTransitionsBuilder {
  const FadePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final fastAnimation = CurvedAnimation(
      parent: animation,
      curve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
    );
    return FadeTransition(opacity: fastAnimation, child: child);
  }
}
