import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionCard extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final String transactionId;
  final bool isWon;

  const TransactionCard({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.transactionId,
    required this.isWon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 4.h),
            blurRadius: 20.r,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          _buildIcon(),
          15.w.horizontalSpace,
          Expanded(child: _buildDetails()),
          _buildAmountInfo(),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: isWon ? Color(0xFFDAE4E2) : AppColors.transactionLostBg,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: SvgIcon(
          isWon ? AppAssets.arrowup : AppAssets.arrowdown,
          size: 18.sp,
          color: isWon ? Color(0xFF064E3B) : AppColors.transactionLost,
        ),
      ),
    );
  }

  Widget _buildDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.poppinsDisplayRegular(
            fontSize: 14.sp,
            color: AppColors.blackColor,
          ),
        ),
        Text(
          date,
          style: AppTextStyles.sfProTextLight(
            fontSize: 12.sp,
            color: AppColors.greyColor,
          ),
        ),
      ],
    );
  }

  Widget _buildAmountInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomGradientText(
          text: "${isWon ? '+' : '-'}₹$amount",
          style: AppTextStyles.sfProTextRegular(
            fontSize: 16.sp,
            color: isWon ? AppColors.transactionWon : AppColors.transactionLost,
          ),

          outlineWidth: 0,
          shadows: const [],
        ),
        Text(
          transactionId,
          style: AppTextStyles.sfProTextLight(
            fontSize: 12.sp,
            color: AppColors.greyColor,
          ),
        ),
      ],
    );
  }
}
