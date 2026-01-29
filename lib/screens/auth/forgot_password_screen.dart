import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/app_card.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_back_button.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_info_box.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_text_field.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isPhoneSelected = true;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _showInfoBox = true;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_updateVisibility);
    _emailController.addListener(_updateVisibility);
  }

  void _updateVisibility() {
    final hasText = isPhoneSelected
        ? _phoneController.text.isNotEmpty
        : _emailController.text.isNotEmpty;

    setState(() {
      _showInfoBox = !hasText;
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, 
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 25.h),
        child: AppButton(
          text: "Send OTP",
          onTap: () {
            context.pushNamed(UserAppRoutes.otpVerificationScreen.name);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(), 
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.h.verticalSpace,
                CustomBackButton(onTap: () => context.pop()),
                30.h.verticalSpace,

                Center(
                  child: CustomGradientText(
                    text: "Forgot password",
                                    letterSpacing: 0.5.sp

                  ),
                ),

                12.h.verticalSpace,
                Center(
                  child: Text(
                    "Enter your registered phone number or email to receive an OTP",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStyle16Regular.copyWith(
                      color: const Color(0xFF110600),
                      fontSize: 15.sp,
                    ),
                  ),
                ),

                30.h.verticalSpace,

                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        text: "Phone number",
                        height: 60,
                        onTap: () {
                          setState(() => isPhoneSelected = true);
                          _updateVisibility();
                        },
                        gradient: isPhoneSelected
                            ? const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.buttonGradientStart,
                                  AppColors.buttonGradientEnd,
                                ],
                              )
                            : null,
                        color: isPhoneSelected
                            ? null
                            : AppColors.backButtonBackgroundColor,
                        borderColor: isPhoneSelected
                            ? AppColors.primaryColor
                            : AppColors.backButtonBorderColor,
                        borderWidth: isPhoneSelected ? 0 : 2,
                        shadowColor: isPhoneSelected
                            ? AppColors.primaryColor
                            : AppColors.backButtonShadowColor,
                        textStyle: AppTextStyles.textStyle14Regular.copyWith(
                          color: isPhoneSelected
                              ? Colors.white
                              : AppColors.secondaryColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: AppButton(
                        text: "Email",
                        height: 60,
                        onTap: () {
                          setState(() => isPhoneSelected = false);
                          _updateVisibility();
                        },
                        gradient: !isPhoneSelected
                            ? const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.buttonGradientStart,
                                  AppColors.buttonGradientEnd,
                                ],
                              )
                            : null,
                        color: !isPhoneSelected
                            ? null
                            : AppColors.backButtonBackgroundColor,
                        borderColor: !isPhoneSelected
                            ? AppColors.primaryColor
                            : AppColors.backButtonBorderColor,
                        borderWidth: !isPhoneSelected ? 0 : 2,
                        shadowColor: !isPhoneSelected
                            ? AppColors.primaryColor
                            : AppColors.backButtonShadowColor,
                        textStyle: AppTextStyles.textStyle14Regular.copyWith(
                          color: !isPhoneSelected
                              ? Colors.white
                              : AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),

                30.h.verticalSpace,

                if (isPhoneSelected)
                  CustomTextField(
                    controller: _phoneController,
                    label: "Phone number",
                    hintText: "98564 95264",
                    keyboardType: TextInputType.phone,
                    hintStyle: AppTextStyles.textStyle14Regular.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                    prefix: AppCard(
                      width: 60.w,
                      height: 60.h,
                      borderRadius: BorderRadius.circular(10.r),
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Center(
                        child: Text(
                          "+91",
                          style: AppTextStyles.textStyle14Regular.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  CustomTextField(
                    controller: _emailController,
                    label: "Email",
                    hintText: "your@example.com",
                    keyboardType: TextInputType.emailAddress,
                    hintStyle: AppTextStyles.textStyle14Regular.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),

                if (!_showInfoBox) ...[
                  30.h.verticalSpace,
                  const CustomInfoBox(
                    text:
                        "We'll send a 6-digit OTP to verify your identity. You can then create a new password.",
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
