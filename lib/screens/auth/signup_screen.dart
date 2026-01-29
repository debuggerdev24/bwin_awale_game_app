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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _selectedGender = "Male";
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 25.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              text: "Continue",
              onTap: () {
                context.pushNamed(UserAppRoutes.kycVerification.name);
              },
            ),
            12.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: AppTextStyles.textStyle14Regular.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Text(
                    "Login",
                    style: AppTextStyles.textStyle14Regular.copyWith(
                      color: const Color(0xFF00A651),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.h.verticalSpace,
                Center(
                  child: Image.asset(
                    AppAssets.createaccount,
                    width: 100.w,
                    height: 110.h,
                    fit: BoxFit.contain,
                  ),
                ),
                20.h.verticalSpace,
                Center(
                  child: CustomGradientText(
                    text: "Create account",
                    letterSpacing: 0.5.sp,
                    style: AppTextStyles.textStyle32Bold.copyWith(
                      fontSize: 32.sp,
                    ),
                  ),
                ),
                4.h.verticalSpace,
                Center(
                  child: Text(
                    "Sign up to start winning",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStyle14Regular.copyWith(
                      color: Color(0xFF8B7D52),
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                25.h.verticalSpace,
                CustomTextField(
                  controller: _nameController,
                  label: "Name",
                  hintText: "Enter your name",
                ),
                20.h.verticalSpace,
                CustomTextField(
                  controller: _emailController,
                  label: "Email",
                  hintText: "Enter your email",
                  keyboardType: TextInputType.emailAddress,
                ),
                20.h.verticalSpace,
                CustomTextField(
                  controller: _phoneController,
                  label: "Phone number",
                  hintText: "98564 95264",
                  keyboardType: TextInputType.phone,
                  prefix: AppCard(
                    width: 60.w,
                    height: 50.h,
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
                ),
                20.h.verticalSpace,
                CustomTextField(
                  controller: _passwordController,
                  label: "Password",
                  hintText: "Enter your password",
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: SvgIcon(
                        _obscurePassword
                            ? AppAssets.hidepassword
                            : AppAssets.password,
                        size: 24.sp,
                      ),
                    ),
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                20.h.verticalSpace,
                CustomTextField(
                  controller: _confirmPasswordController,
                  label: "Confirm password",
                  hintText: "Enter your confirm password",
                  obscureText: _obscureConfirmPassword,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: SvgIcon(
                        _obscureConfirmPassword
                            ? AppAssets.hidepassword
                            : AppAssets.password,
                        size: 24.sp,
                      ),
                    ),
                    onPressed: () => setState(
                      () => _obscureConfirmPassword = !_obscureConfirmPassword,
                    ),
                  ),
                ),
                20.h.verticalSpace,
                Text(
                  "Gender",
                  style: AppTextStyles.textStyle14Regular.copyWith(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                8.h.verticalSpace,
                AppCard(
                  height: 60.h,
                  borderRadius: BorderRadius.circular(10.r),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedGender,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.secondaryColor,
                      ),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _selectedGender = newValue;
                          });
                        }
                      },
                      items: <String>['Male', 'Female', 'Other']
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: AppTextStyles.textStyle14Regular
                                    .copyWith(color: AppColors.secondaryColor),
                              ),
                            );
                          })
                          .toList(),
                    ),
                  ),
                ),
                30.h.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
