import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/app_card.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AgeVerificationScreen extends StatefulWidget {
  const AgeVerificationScreen({super.key});

  @override
  State<AgeVerificationScreen> createState() => _AgeVerificationScreenState();
}

class _AgeVerificationScreenState extends State<AgeVerificationScreen> {
  bool _isAgeConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),
                      // Badge Image
                      Image.asset(
                        AppAssets.ageverification,
                        width: 110.w,
                        height: 110.h,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 30.h),
                      CustomGradientText(
                        text: "Age verification",
                        letterSpacing: 0.5.sp,
                        style: AppTextStyles.textStyle32Bold.copyWith(
                          fontSize: 35.sp,
                        ),
                      ),
                      SizedBox(height: 12.h),

                      Text(
                        "You must be 18+ years or older to use\nthis app",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.textStyle16Regular.copyWith(
                          color: AppColors.secondaryColor,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      // Rules Card
                      AppCard(
                        padding: EdgeInsets.all(20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomGradientText(
                              text: "Minimum age requirement 18+",
                              letterSpacing: 0.5.sp,

                              outlineWidth: 1.5.sp,
                              style: AppTextStyles.textStyle32Bold.copyWith(
                                fontSize: 17.sp,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            _buildBulletPoint(
                              "Real money gambling is restricted to adults",
                            ),
                            _buildBulletPoint(
                              "You may be asked to verify your identity",
                            ),
                            _buildBulletPoint(
                              "Underage gambling is illegal and prohibited",
                            ),
                            // Checkbox Row
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isAgeConfirmed = !_isAgeConfirmed;
                                });
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgIcon(
                                    _isAgeConfirmed
                                        ? AppAssets.checkfill
                                        : AppAssets.checkbox,
                                    size: 24.w,
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Text(
                                      "I confirm that i am 18 years of age or older and agree to comply with all applicable laws and regulations",
                                      style: AppTextStyles.textStyle14Regular
                                          .copyWith(
                                            fontSize: 13.sp,
                                            color: AppColors.secondaryColor,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Opacity(
                opacity: _isAgeConfirmed ? 1.0 : 0.3,
                child: AppButton(
                  text: "Continue",
                  onTap: _isAgeConfirmed
                      ? () {
                          context.pushNamed(UserAppRoutes.loginScreen.name);
                        }
                      : () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, left: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: Container(
              width: 5.w,
              height: 5.w,
              decoration: const BoxDecoration(
                color: AppColors.secondaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.textStyle14Regular.copyWith(
                fontSize: 13.sp,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
