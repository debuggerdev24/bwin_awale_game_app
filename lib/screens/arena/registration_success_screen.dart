import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/app_card.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  const RegistrationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const Spacer(),
              _buildSuccessIcon(),
              30.h.verticalSpace,
              Text(
                "Registration Successful!",
                style: AppTextStyles.poppinsDisplayMedium(
                  fontSize: 24.sp,
                  color: AppColors.blackColor,
                ),
              ),
              12.h.verticalSpace,
              Text(
                "You have registered for: Champions Cup",
                style: AppTextStyles.sfProTextRegular(
                  fontSize: 14.sp,
                  color: AppColors.greyColor,
                ),
              ),
              40.h.verticalSpace,
              _buildTimeCard(),
              const Spacer(),
              AppButton(
                text: "Back to arena",
                onTap: () => context.goNamed(UserAppRoutes.tabScreen.name),
              ),
              30.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessIcon() {
    return Container(
      width: 120.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: const Color(0xFFDAE4E2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgIcon(
          AppAssets.registration,
          size: 60.sp,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  Widget _buildTimeCard() {
    return AppCard(
      height: 130.h,
      color: const Color(0xFFE6EDEB),
      borderColor: const Color(0xFFDAE4E2),
      shadowColor: const Color(0xFFB2C8C2),
      borderRadius: BorderRadius.circular(10.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Match start time",
            style: AppTextStyles.poppinsDisplayRegular(
              fontSize: 14.sp,
              color: AppColors.greyColor,
            ),
          ),
          12.h.verticalSpace,
          Text(
            "Today 09:00 PM",
            style: AppTextStyles.poppinsDisplayMedium(
              fontSize: 24.sp,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
