import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onTap;

  const SkipButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.skipButtonBackgroundColor,
          borderRadius: BorderRadius.circular(20.r),
          border: Border(
            top: BorderSide.none,
            right: BorderSide(color: AppColors.primaryColor, width: 1.w),
            bottom: BorderSide(color: AppColors.primaryColor, width: 2.h),
            left: BorderSide(color: AppColors.primaryColor, width: 1.w),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          "Skip",
          style: AppTextStyles.textStyle14Regular.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
