import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/app_card.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_app_bar.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_info_box.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class KycVerificationScreen extends StatelessWidget {
  const KycVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 25.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(text: "Submit & Proceed", onTap: () {}),
            16.h.verticalSpace,
            GestureDetector(
              onTap: () {
                // Skip logic
              },
              child: Text(
                "Skip for now",
                style: AppTextStyles.textStyle16Regular.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
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
                const CustomAppBar(title: "KYC verification"),
                Center(
                  child: Image.asset(
                    AppAssets.kycverification,
                    width: 100.w,
                    height: 110.h,
                    fit: BoxFit.contain,
                  ),
                ),
                20.h.verticalSpace,
                10.h.verticalSpace,
                Center(
                  child: Text(
                    "To comply with regulations and secure your \naccount, we need to verify your identity",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStyle16Regular.copyWith(
                      color: const Color(0xFF433613),
                      height: 1.5,
                    ),
                  ),
                ),
                30.h.verticalSpace,
                AppCard(
                  padding: EdgeInsets.all(20.r),
                  color: Colors.white,
                  borderColor: const Color(0xFFB2C8C2),
                  shadowColor: AppColors.primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomGradientText(
                        outlineWidth: 1.w,
                        text: "Identity validation",
                        style: AppTextStyles.textStyle32Bold.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                      16.h.verticalSpace,
                      _buildValidationItem(
                        icon: AppAssets.govermaent,
                        title: "Government ID",
                        subtitle: "Aadhaar, PAN, or Passport",
                        onTap: () {
                          context.pushNamed(UserAppRoutes.idUpload.name);
                        },
                      ),
                      20.h.verticalSpace,
                      _buildValidationItem(
                        icon: AppAssets.livepotrait,
                        title: "Live portrait",
                        subtitle: "Face verification",
                        onTap: () {
                          context.pushNamed(
                            UserAppRoutes.faceVerification.name,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                20.h.verticalSpace,
                CustomInfoBox(
                  text:
                      "Note: KYC verification is mandatory to deposit, withdraw, and play with real money.",
                ),

                30.h.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildValidationItem({
    required String icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: const Color(0xFFDCECDE),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: const Color(0xFFB2C8C2), width: 1.w),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor,
                  offset: const Offset(1, 2),
                  blurRadius: 0,
                  spreadRadius: 0,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: SvgIcon(icon, size: 24.sp, color: AppColors.primaryColor),
          ),
          15.w.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.textStyle16Regular.copyWith(
                    color: const Color(0xFF110600),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                2.h.verticalSpace,
                Text(
                  subtitle,
                  style: AppTextStyles.sfProTextLight(
                    fontSize: 12.sp,
                  ).copyWith(color: const Color(0xFF110600).withOpacity(0.5)),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16.sp,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
