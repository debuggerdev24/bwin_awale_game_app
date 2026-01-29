import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final Color? shadowColor;
  final Offset? shadowOffset;
  final Gradient? gradient;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.borderRadius,
    this.color,
    this.borderColor,
    this.borderWidth,
    this.shadowColor,
    this.shadowOffset,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: gradient == null
            ? (color ?? AppColors.backButtonBackgroundColor)
            : null,
        gradient: gradient,
        borderRadius: borderRadius ?? BorderRadius.circular(20.r),
        border: Border.all(
          color: borderColor ?? AppColors.backButtonBorderColor,
          width: (borderWidth ?? 2).w,
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? AppColors.backButtonShadowColor,
            offset: shadowOffset ?? Offset(0, 4.h),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
