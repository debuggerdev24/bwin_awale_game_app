import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArenaCard extends StatelessWidget {
  final String league;
  final String name;
  final String initials;
  final String prize;
  final String bet;
  final VoidCallback onJoinTap;

  const ArenaCard({
    super.key,
    required this.league,
    required this.name,
    required this.initials,
    required this.prize,
    required this.bet,
    required this.onJoinTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
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
                  border: BoxBorder.all(color: AppColors.backButtonBorderColor),
                  color: AppColors.backButtonBackgroundColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  league,
                  style: AppTextStyles.sfProTextLight(
                    fontSize: 12.sp,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.green, size: 5.w),
                  12.w.horizontalSpace,
                  CustomGradientText(
                    text: "Live",
                    style: AppTextStyles.textStyle16Regular,
                    outlineWidth: 0,
                    shadows: const [],
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: Color(0xFFB8B8B8)),
                  color: const Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: AppTextStyles.sfProTextMedium(
                      fontSize: 18.sp,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Prize pot",
                      style: AppTextStyles.sfProTextLight(
                        fontSize: 12.sp,
                        color: AppColors.greyColor,
                      ),
                    ),
                    Text(
                      "₹$prize",
                      style: AppTextStyles.poppinsDisplayRegular(
                        fontSize: 16.sp,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: Column(
                  children: [
                    Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDCECDE),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          "VS",
                          style: AppTextStyles.poppinsDisplayMedium(
                            fontSize: 18.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    4.h.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  style: AppTextStyles.sfProTextRegular(
                    fontSize: 14.sp,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 14.w),
                child: Text(
                  "Join",
                  style: AppTextStyles.sfProTextRegular(
                    fontSize: 14.sp,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
          Divider(color: Color(0xFFE0E0E0)),
          10.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₹$bet",
                style: AppTextStyles.sfProTextLight(
                  fontSize: 12.sp,
                  color: AppColors.greyColor,
                ),
              ),
              AppButton(
                text: "Join arena",
                onTap: onJoinTap,
                width: 120.w,
                height: 40.h,
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
