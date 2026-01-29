import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.h,
      decoration: BoxDecoration(
        color: AppColors.backButtonBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        border: Border.all(color: AppColors.backButtonBorderColor, width: 2.w),
        boxShadow: [
          BoxShadow(
            color: AppColors.backButtonShadowColor,
            offset: Offset(0, 4.h),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, AppAssets.home, 'Home'),
          _buildNavItem(1, AppAssets.arena, 'Arena'),
          _buildNavItem(2, AppAssets.wallet, 'Wallet'),
          _buildNavItem(3, AppAssets.freinds, 'Friends'),
          _buildNavItem(4, AppAssets.profile, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String icon, String label) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: isSelected
          ? Container(
              width: 65.w,
              height: 65.h,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.buttonGradientStart,
                    AppColors.buttonGradientEnd,
                  ],
                ),
                borderRadius: BorderRadius.circular(10.r),
                border: Border(
                  top: BorderSide(color: AppColors.primaryColor, width: 1.w),
                  left: BorderSide(color: AppColors.primaryColor, width: 1.w),
                  right: BorderSide(color: AppColors.primaryColor, width: 1.w),
                  bottom: BorderSide(color: AppColors.primaryColor, width: 4.w),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgIcon(icon, color: AppColors.whiteColor, size: 24.sp),
                  SizedBox(height: 4.h),
                  Text(
                    label,
                    style: AppTextStyles.sfProTextLight(
                      fontSize: 10.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgIcon(icon, color: Color(0xFF606060), size: 24.sp),
                SizedBox(height: 4.h),
                Text(
                  label,
                  style: AppTextStyles.sfProTextLight(
                    fontSize: 10.sp,
                    color: Color(0xFF606060),
                  ),
                ),
              ],
            ),
    );
  }
}
