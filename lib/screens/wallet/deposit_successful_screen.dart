import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DepositSuccessfulScreen extends StatelessWidget {
  final String transactionId;
  final String amount;
  final String paymentMethod;
  final String newBalance;

  const DepositSuccessfulScreen({
    super.key,
    this.transactionId = "TXN789456321",
    this.amount = "₹500.00",
    this.paymentMethod = "UPI",
    this.newBalance = "₹2,450.00",
  });

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
              30.h.verticalSpace,
              Text(
                "Deposit successful!",
                style: AppTextStyles.sfProTextMedium(
                  fontSize: 24.sp,
                  color: AppColors.blackColor,
                ),
              ),
              12.h.verticalSpace,
              Text(
                "$amount has been added to your wallet",
                textAlign: TextAlign.center,
                style: AppTextStyles.sfProTextRegular(
                  fontSize: 14.sp,
                  color: AppColors.greyColor,
                ),
              ),
              30.h.verticalSpace,
              _buildTransactionDetails(),
              const Spacer(),
              AppButton(
                text: "Continue",
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
              20.h.verticalSpace,
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

  Widget _buildTransactionDetails() {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          _buildDetailRow("Transaction ID", transactionId),
          _buildDetailRow("Amount", amount),
          _buildDetailRow("Payment method", paymentMethod),
          _buildDetailRow(
            "New balance",
            newBalance,
            isBold: true,
            valueColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    bool isBold = false,
    Color? valueColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
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
            style: isBold
                ? AppTextStyles.sfProTextRegular(
                    fontSize: 14.sp,
                    color: valueColor ?? AppColors.blackColor,
                  )
                : AppTextStyles.sfProTextRegular(
                    fontSize: 14.sp,
                    color: valueColor ?? AppColors.blackColor,
                  ),
          ),
        ],
      ),
    );
  }
}
