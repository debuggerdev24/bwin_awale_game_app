import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PayoutCompleteScreen extends StatelessWidget {
  const PayoutCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const Spacer(),
              _buildSuccessIndicator(),
              40.h.verticalSpace,
              Text(
                "Payout complete!",
                style: AppTextStyles.poppinsDisplayMedium(
                  fontSize: 24.sp,
                  color: AppColors.blackColor,
                ),
              ),
              12.h.verticalSpace,
              Text(
                "Your winnings have been credited to your wallet",
                textAlign: TextAlign.center,
                style: AppTextStyles.poppinsDisplayRegular(
                  fontSize: 14.sp,
                  color: AppColors.greyColor,
                ),
              ),
              40.h.verticalSpace,
              _buildSummaryCard(),
              const Spacer(),
              AppButton(
                text: "Back to home",
                onTap: () => context.goNamed(UserAppRoutes.tabScreen.name),
              ),
              20.h.verticalSpace,
              GestureDetector(
                onTap: () {},
                child: Text(
                  "View transaction history",
                  style: AppTextStyles.sfProTextRegular(
                    fontSize: 14.sp,
                    color: AppColors.secondaryColor,
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
      width: 120.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: AppColors.transactionIconBg,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgIcon(
          AppAssets.check,
          color: AppColors.primaryColor,
          size: 40.sp,
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                padding: EdgeInsets.all(15.w),
                decoration: const BoxDecoration(
                  color: Color(0xFFB2C8C2),
                  shape: BoxShape.circle,
                ),
                child: SvgIcon(
                  AppAssets.wallet,
                  size: 20.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              15.w.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Winnings",
                    style: AppTextStyles.sfProTextLight(
                      fontSize: 12.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                  4.h.verticalSpace,
                  Text(
                    "+₹380",
                    style: AppTextStyles.sfProTextRegular(
                      fontSize: 16.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          10.h.verticalSpace,
          const Divider(color: Color(0xFFE0E0E0)),
          10.h.verticalSpace,
          _buildDetailRow("Previous balance", "₹2,450.00"),
          15.h.verticalSpace,
          _buildDetailRow(
            "Winnings added",
            "+₹380.00",
            valueColor: AppColors.primaryColor,
          ),
          18.h.verticalSpace,
          const Divider(color: Color(0xFFE0E0E0)),
          15.h.verticalSpace,
          _buildDetailRow(
            "New balance",
            "₹2,830.00",
            valueColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? valueColor}) {
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
}
