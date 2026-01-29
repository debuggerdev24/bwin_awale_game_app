import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_back_button.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_text_field.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 25.h),
        child: AppButton(text: "Confirm", onTap: () {}),
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
                CustomGradientText(
                  text: "Create new password",
                  letterSpacing: 0.5.sp,
                ),
                12.h.verticalSpace,
                Text(
                  "Secure your arena identity with a strong new password.",
                  style: AppTextStyles.textStyle16Regular.copyWith(
                    color: const Color(0xFF110600),
                  ),
                ),
                CustomTextField(
                  controller: _passwordController,
                  label: "Password",
                  hintText: "Enter your password",
                  obscureText: _obscurePassword,
                  hintStyle: AppTextStyles.textStyle14Regular.copyWith(
                    color: const Color(0xFF8B7D52),
                  ),
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
                  hintStyle: AppTextStyles.textStyle14Regular.copyWith(
                    color: const Color(0xFF8B7D52),
                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
