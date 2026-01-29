import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickAmountButton extends StatelessWidget {
  final String amount;
  final VoidCallback onTap;

  const QuickAmountButton({
    super.key,
    required this.amount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color(0xFFE0E0E0), width: 0.5.w),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor,
              offset: Offset(0, 2.h),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          "₹$amount",
          style: AppTextStyles.sfProTextRegular(
            fontSize: 14.sp,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
