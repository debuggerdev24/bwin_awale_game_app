import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final Color? shadowColor;
  final Offset? shadowOffset;
  final double? borderRadius;
  final TextStyle? textStyle;
  final bool isEnabled;
  final List<BoxShadow>? shadows;

  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.gradient,
    this.color,
    this.borderColor,
    this.borderWidth,
    this.shadowColor,
    this.shadowOffset,
    this.borderRadius,
    this.textStyle,
    this.isEnabled = true,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Opacity(
        opacity: isEnabled ? 1.0 : 0.3,
        child: Container(
          width: width?.w ?? 390.w,
          height: height?.h ?? 60.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular((borderRadius ?? 10).r),
            color: isEnabled
                ? (gradient == null
                      ? (color ?? AppColors.buttonGradientStart)
                      : null)
                : AppColors.greyColor.withOpacity(0.5),
            gradient: isEnabled
                ? (gradient ??
                      (color == null
                          ? const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.buttonGradientStart,
                                AppColors.buttonGradientEnd,
                              ],
                            )
                          : null))
                : null,
            border: Border.all(
              color: isEnabled
                  ? (borderColor ?? AppColors.primaryColor)
                  : AppColors.greyColor,
              width: (borderWidth ?? 0).w,
            ),
            boxShadow: isEnabled
                ? (shadows ??
                      [
                        BoxShadow(
                          color: shadowColor ?? AppColors.primaryColor,
                          offset: shadowOffset ?? Offset(0, 4.h),
                          blurRadius: 0,
                          spreadRadius: 0,
                        ),
                      ])
                : null,
          ),
          child: Text(
            text,
            style:
                textStyle ??
                AppTextStyles.poppinsDisplayMedium(
                  fontSize: 18.sp,
                  color: AppColors.whiteColor,
                ),
          ),
        ),
      ),
    );
  }
}
