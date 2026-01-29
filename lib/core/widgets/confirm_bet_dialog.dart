import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmBetDialog extends StatelessWidget {
  final String opponent;
  final double amount;
  final double fee;
  final double potentialWinnings;

  const ConfirmBetDialog({
    super.key,
    required this.opponent,
    required this.amount,
    required this.fee,
    required this.potentialWinnings,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Confirm bet",
                  style: AppTextStyles.poppinsDisplayMedium(
                    fontSize: 18.sp,
                    color: AppColors.blackColor,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.black),
                ),
              ],
            ),
            15.h.verticalSpace,
            _buildWarningBox(),
            20.h.verticalSpace,
            _buildDetailRow("Opponent", opponent),
            20.h.verticalSpace,
            _buildDetailRow("Bet amount", "₹${amount.toInt()}"),
            20.h.verticalSpace,
            _buildDetailRow("Platform fee (5%)", "₹${fee.toInt()}"),
            20.h.verticalSpace,
            Container(height: 1, color: const Color(0xFFE0E0E0)),
            15.h.verticalSpace,
            _buildDetailRow(
              "Total deduction",
              "-₹${amount.toInt()}.00",
              valueColor: const Color(0xFFF44336),
            ),
            12.h.verticalSpace,
            _buildDetailRow(
              "Potential winnings",
              "₹${potentialWinnings.toInt()}.00",
              valueColor: AppColors.primaryColor,
              isBold: true,
            ),
            25.h.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    height: 60.h,
                    text: "Cancel",
                    onTap: () => Navigator.pop(context),
                    color: const Color(0xFFE0E0E0),
                    borderColor: const Color(0xFFB8B8B8),
                    shadowColor: const Color(0xFFB8B8B8),
                    textStyle: AppTextStyles.poppinsDisplayRegular(
                      fontSize: 14.sp,
                      color: Colors.black54,
                    ),
                  ),
                ),
                15.w.horizontalSpace,
                Expanded(
                  child: AppButton(
                    height: 60.h,
                    text: "Confirm bet",
                    onTap: () {
                      Navigator.pop(context);
                      context.pushNamed(UserAppRoutes.matchWaitingScreen.name);
                    },
                    textStyle: AppTextStyles.poppinsDisplayRegular(
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWarningBox() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF1E5),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFFCDAB7)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: const Color(0xFFF57C00), size: 20.sp),
          10.w.horizontalSpace,
          Expanded(
            child: Text(
              "Your bet amount will be locked until the game is completed. Make sure you're ready to play.",
              style: AppTextStyles.sfProTextRegular(
                fontSize: 14.sp,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    Color? valueColor,
    bool isBold = false,
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
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
