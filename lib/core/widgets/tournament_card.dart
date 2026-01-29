import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TournamentCard extends StatelessWidget {
  final String league;
  final String title;
  final String time;
  final String participants;
  final String prize;
  final VoidCallback onRegisterTap;

  const TournamentCard({
    super.key,
    required this.league,
    required this.title,
    required this.time,
    required this.participants,
    required this.prize,
    required this.onRegisterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFE0E0E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.backButtonBackgroundColor,
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(color: AppColors.backButtonBorderColor),
                ),
                child: Text(
                  league,
                  style: AppTextStyles.sfProTextLight(
                    fontSize: 12.sp,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
              Text(
                participants,
                style: AppTextStyles.sfProTextLight(
                  fontSize: 12.sp,
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),
          15.h.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomGradientText(
                      text: title,
                      style: AppTextStyles.textStyle14Regular,
                      outlineWidth: 0,
                      shadows: const [],
                    ),
                    4.h.verticalSpace,
                    Text(
                      time,
                      style: AppTextStyles.sfProTextLight(
                        fontSize: 12.sp,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCECDE),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: SvgIcon(
                  AppAssets.cupicon,
                  size: 20.sp,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          15.h.verticalSpace,
          const Divider(color: Color(0xFFE0E0E0)),
          10.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Grand prize",
                    style: AppTextStyles.sfProTextLight(
                      fontSize: 12.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                  8.h.verticalSpace,
                  Text(
                    "₹$prize",
                    style: AppTextStyles.poppinsDisplayRegular(
                      fontSize: 16.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              AppButton(
                text: "Register",
                onTap: onRegisterTap,
                width: 100.w,
                height: 35.h,
                textStyle: AppTextStyles.sfProTextLight(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
