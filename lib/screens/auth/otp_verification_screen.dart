import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_back_button.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 25.h),
        child: AppButton(
          text: "Verify",
          onTap: () {
            context.pushNamed(UserAppRoutes.createNewPasswordScreen.name);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.h.verticalSpace,
                CustomBackButton(onTap: () => context.pop()),
                30.h.verticalSpace,
                Center(
                  child: CustomGradientText(
                    text: "Verify phone number",
                    textAlign: TextAlign.center,
                    letterSpacing: 0.5.sp,
                  ),
                ),
                20.h.verticalSpace,
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: AppTextStyles.textStyle16Regular.copyWith(
                      color: const Color(0xFF110600),
                      fontSize: 16.sp,
                    ),
                    children: [
                      const TextSpan(
                        text: "Enter OTP code we sent a 6-digit code to \n",
                      ),
                      TextSpan(
                        text: "+91 98765 49875",
                        style: AppTextStyles.textStyle16Regular.copyWith(
                          color: const Color(0xFF110600),
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                40.h.verticalSpace,
                // OTP Input using Pinput
                Center(
                  child: Pinput(
                    length: 6,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    defaultPinTheme: PinTheme(
                      width: 55.w,
                      height: 50.h,
                      textStyle: AppTextStyles.textStyle14Regular.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6E8B1),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: const Color(0xFFF1D28C)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF786F39),
                            offset: Offset(0, 4.h),
                            blurRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 55.w,
                      height: 50.h,
                      textStyle: AppTextStyles.textStyle14Regular.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6E8B1),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: const Color(0xFFF1D28C)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF786F39),
                            offset: Offset(0, 4.h),
                            blurRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    submittedPinTheme: PinTheme(
                      width: 55.w,
                      height: 50.h,
                      textStyle: AppTextStyles.textStyle14Regular.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6E8B1),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: const Color(0xFFF1D28C)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF786F39),
                            offset: Offset(0, 4.h),
                            blurRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                30.h.verticalSpace,
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyles.textStyle14Regular.copyWith(
                        color: AppColors.secondaryColor,
                        fontSize: 14.sp,
                      ),
                      children: [
                        const TextSpan(text: "Resend code in "),
                        TextSpan(
                          text: "29s",
                          style: AppTextStyles.textStyle16Regular.copyWith(
                            color: AppColors.buttonGradientEnd,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
