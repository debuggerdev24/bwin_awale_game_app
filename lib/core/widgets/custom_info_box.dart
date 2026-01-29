import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInfoBox extends StatelessWidget {
  final String text;
  final double? height;
  final TextStyle? textStyle;

  const CustomInfoBox({
    super.key,
    required this.text,
    this.height,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      height: height ?? 80.h,
      color: const Color(0xFFE6EDEB),
      borderColor: const Color(0xFFDAE4E2),
      shadowColor: const Color(0xFFB2C8C2),
      borderRadius: BorderRadius.circular(10.r),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.start,
          style:
              textStyle ??
              AppTextStyles.textStyle14Regular.copyWith(
                color: AppColors.secondaryColor,
                fontSize: 13.sp,
              ),
        ),
      ),
    );
  }
}
