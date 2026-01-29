import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WithdrawSuccessScreen extends StatelessWidget {
  const WithdrawSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const Spacer(flex: 6),
              _buildSuccessIndicator(),
              30.h.verticalSpace,
              Text(
                "Withdrawal initiated!",
                style: AppTextStyles.poppinsDisplayMedium(
                  fontSize: 24.sp,
                  color: AppColors.blackColor,
                ),
              ),
              12.h.verticalSpace,
              Text(
                "Your withdrawal request has been submitted",
                textAlign: TextAlign.center,
                style: AppTextStyles.sfProTextRegular(
                  fontSize: 14.sp,
                  color: AppColors.greyColor,
                ),
              ),
              40.h.verticalSpace,
              _buildDetailsCard(),
              30.h.verticalSpace,
              _buildProcessingBox(),
              const Spacer(flex: 3),
              AppButton(
                text: "Back to home",
                onTap: () => context.goNamed(UserAppRoutes.tabScreen.name),
              ),
              20.h.verticalSpace,
              GestureDetector(
                onTap: () {
                  context.pushNamed(UserAppRoutes.tabScreen.name);
                },
                child: Text(
                  "View transaction history",
                  style: AppTextStyles.sfProTextRegular(
                    fontSize: 14.sp,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              30.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessIndicator() {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: const BoxDecoration(
        color: Color(0xFFDAE4E2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Center(
          child: SvgIcon(
            AppAssets.check,
            color: AppColors.primaryColor,
            size: 40.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        children: [
          _buildDetailRow("Withdrawal ID", "WD123456789"),
          15.h.verticalSpace,
          _buildDetailRow("Amount", "₹1,000"),
          15.h.verticalSpace,
          _buildDetailRow("Method", "Bank Account"),
          15.h.verticalSpace,
          _buildDetailRow("Account", "HDFC ****6789"),
          15.h.verticalSpace,
          const Divider(color: Color(0xFFE0E0E0)),
          15.h.verticalSpace,
          _buildDetailRow(
            "New balance",
            "₹1,830.00",
            valueColor: AppColors.primaryColor,
            isMedium: true,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    Color? valueColor,
    bool isMedium = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.sfProTextLight(
            fontSize: 12.sp,
            color: AppColors.greyColor,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.sfProTextRegular(
            fontSize: 14.sp,
            color: valueColor ?? AppColors.blackColor,
          ),
        ),
      ],
    );
  }

  Widget _buildProcessingBox() {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF1E5),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFFCDAB7)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: const Color(0xFFF57C00), size: 20.sp),
          12.w.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Processing...",
                  style: AppTextStyles.sfProTextRegular(
                    fontSize: 14.sp,
                    color: AppColors.blackColor,
                  ),
                ),
                4.h.verticalSpace,
                Text(
                  "Your money will be transferred within 1-2 business days. You'll receive an SMS confirmation.",
                  style: AppTextStyles.sfProTextLight(
                    fontSize: 12.sp,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
