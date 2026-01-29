import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? icon;
  final double? width;
  final double? height;
  final double? iconSize;

  const CustomBackButton({
    super.key,
    required this.onTap,
    this.icon,
    this.width,
    this.height,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?.w ?? 60.w,
        height: height?.h ?? 60.h,
        decoration: BoxDecoration(
          color: AppColors.backButtonBackgroundColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.backButtonBorderColor,
            width: 2.w,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.backButtonShadowColor,
              offset: Offset(0, 4.h),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          icon ?? AppAssets.backicon,
          width: iconSize?.w ?? 14.w,
          height: iconSize?.h ?? 14.h,
        ),
      ),
    );
  }
}
