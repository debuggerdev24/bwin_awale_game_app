import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GameResultScreen extends StatelessWidget {
  final bool didWin;
  const GameResultScreen({super.key, this.didWin = true});

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
              _buildTrophy(),
              30.h.verticalSpace,
              Text(
                didWin ? "You won!" : "You lost!",
                style: AppTextStyles.poppinsDisplaySemibold(
                  fontSize: 24.sp,
                  color: AppColors.blackColor,
                ),
              ),

              30.h.verticalSpace,
              _buildEarningsTable(),
              const Spacer(),
              if (didWin)
                AppButton(

                  text: "Collect winnings",
                  onTap: () {
                    context.pushNamed(UserAppRoutes.payoutCompleteScreen.name);
                  },
                ),
              if (!didWin)
                AppButton(
                  shadowColor: Color(0xFF991B1B),
                  color: Color(0xFFD32F2F),
                  borderColor: Color(0xFFD32F2F),
                  text: "Play again",
                  onTap: () => context.pop(),
                ),
              20.h.verticalSpace,
              GestureDetector(
                onTap: () => context.pop(),
                child: Text(
                  didWin ? "Play again" : "Back to home",
                  style: AppTextStyles.sfProTextRegular(
                    fontSize: 16.sp,
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

  Widget _buildTrophy() {
    return Container(
      width: 90.w,
      height: 90.h,
      decoration: BoxDecoration(
        color: didWin
            ? AppColors.skipButtonBackgroundColor
            : AppColors.transactionLostBg,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgIcon(
          didWin ? AppAssets.cupicon : AppAssets.close,
          size: 30.w,
          color: didWin ? null : AppColors.redColor,
        ),
      ),
    );
  }

  Widget _buildEarningsTable() {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        children: [
          10.h.verticalSpace,
          Text(
            didWin ? "Your winnings" : "Your lost",
            style: AppTextStyles.sfProTextRegular(
              fontSize: 14.sp,
              color: AppColors.greyColor,
            ),
          ),
          10.h.verticalSpace,
          Text(
            didWin ? "₹380" : "₹200",
            style: AppTextStyles.poppinsDisplayMedium(
              fontSize: 24.sp,
              color: AppColors.blackColor,
            ),
          ),
          10.h.verticalSpace,
          Text(
            didWin ? "Added to your wallet" : "Better luck next time",
            style: AppTextStyles.poppinsDisplayRegular(
              fontSize: 14.sp,
              color: AppColors.greyColor,
            ),
          ),
          20.h.verticalSpace,
          Divider(),
          20.h.verticalSpace,
          _buildTableRow("Game", "#GM7841"),
          20.h.verticalSpace,
          _buildTableRow("Opponent", "Earline R. Walk"),
          20.h.verticalSpace,
          _buildTableRow("Bet amount", "₹200"),
          20.h.verticalSpace,
          _buildTableRow("Final score", "20 - 26"),
        ],
      ),
    );
  }

  Widget _buildTableRow(String label, String value) {
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
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
