import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/app_card.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_text_field.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                40.h.verticalSpace,
                Image.asset(
                  AppAssets.login,
                  width: 100.w,
                  height: 110.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 30.h),
                CustomGradientText(
                  text: "Welcome back",
                  letterSpacing: 0.5.sp,

                  style: AppTextStyles.textStyle32Bold.copyWith(
                    fontSize: 38.sp,
                  ),
                ),
                4.h.verticalSpace,
                Text(
                  "Sign up to start winning",
                  style: AppTextStyles.textStyle16Regular.copyWith(
                    color: AppColors.secondaryColor,
                    fontSize: 16.sp,
                  ),
                ),
                40.h.verticalSpace,
                CustomTextField(
                  label: "Phone number",
                  hintText: "98564 95264",
                  keyboardType: TextInputType.phone,
                  prefix: AppCard(
                    width: 60.w,
                    height: 60.h,
                    borderRadius: BorderRadius.circular(12.r),
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
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  label: "Password",
                  hintText: "Enter your password",
                  obscureText: _isPasswordVisible,
                  hintStyle: AppTextStyles.textStyle14Regular.copyWith(
                    color: const Color(0xFF8B7D52),
                  ),
                  suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: SvgIcon(
                        _isPasswordVisible
                            ? AppAssets.hidepassword
                            : AppAssets.password,
                        size: 24.sp,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                8.h.verticalSpace,
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        UserAppRoutes.forgotPasswordScreen.name,
                      );
                    },
                    child: Text(
                      "Forgot password?",
                      style: AppTextStyles.textStyle14Regular.copyWith(
                        color: AppColors.secondaryColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                80.h.verticalSpace,
                // Continue Button
                AppButton(
                  text: "Continue",
                  onTap: () {
                    context.pushNamed(UserAppRoutes.tabScreen.name);
                  },
                ),
                SizedBox(height: 20.h),

                // Footer Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: AppTextStyles.textStyle14Regular.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(UserAppRoutes.signupScreen.name);
                      },
                      child: Text(
                        "Sign up",
                        style: AppTextStyles.textStyle14Regular.copyWith(
                          color: const Color(0xFF00A651),
                        ),
                      ),
                    ),
                  ],
                ),
                40.h.verticalSpace,
                // Social Login Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        "Continue with",
                        style: AppTextStyles.textStyle14Regular.copyWith(
                          color: Color(0xFF606060),
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                  ],
                ),
                50.h.verticalSpace,
                // Social Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppCard(
                      width: 80.w,
                      height: 60.h,
                      borderRadius: BorderRadius.circular(12.r),
                      child: Center(
                        child: SvgIcon(AppAssets.google, size: 30.w),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    AppCard(
                      width: 80.w,
                      height: 60.h,
                      borderRadius: BorderRadius.circular(12.r),
                      child: Center(
                        child: SvgIcon(AppAssets.facebook, size: 30.w),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
