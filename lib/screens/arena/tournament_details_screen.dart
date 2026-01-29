import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/app_card.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_app_bar.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_back_button.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TournamentDetailsScreen extends StatelessWidget {
  const TournamentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  children: [
                    CustomAppBar(title: "Tournament details"),
                    30.h.verticalSpace,
                    _buildTrophyCard(),
                    24.h.verticalSpace,

                    24.h.verticalSpace,
                    _buildWalletCard(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: AppButton(
                text: "Confirm & Pay ₹500",
                onTap: () =>
                    context.pushNamed(UserAppRoutes.registrationSuccess.name),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrophyCard() {
    return AppCard(
      padding: EdgeInsets.all(20.w),

      child: Stack(
        children: [
          Align(
            alignment: AlignmentGeometry.topRight,
            child: AppButton(
              shadowOffset: Offset(0, 2.h),
              borderRadius: 6.w,
              height: 40.h,
              width: 110.w,
              text: "Grand event",
              onTap: () {},
              textStyle: AppTextStyles.sfProTextLight(
                fontSize: 12.sp,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                60.h.verticalSpace,
                SvgIcon(
                  AppAssets.cupicon,
                  size: 60.w,
                  color: Color(0xFFF57C00),
                ),
                20.h.verticalSpace,
                Text(
                  "Champions Cup",
                  style: AppTextStyles.poppinsDisplayMedium(
                    fontSize: 24.sp,
                    color: AppColors.blackColor,
                  ),
                ),
                2.h.verticalSpace,
                Text(
                  "Today 09:00 PM",
                  style: AppTextStyles.poppinsDisplayRegular(
                    fontSize: 14.sp,
                    color: AppColors.greyColor,
                  ),
                ),
                10.h.verticalSpace,
                Divider(color: AppColors.backButtonBorderColor),
                10.h.verticalSpace,
                Row(
                  children: [
                    Expanded(child: _buildInfoCard("Entry fee", "₹500")),
                    10.w.horizontalSpace,
                    Expanded(
                      child: _buildInfoCard(
                        "Prize pool",
                        "₹25,000",
                        isGreen: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String label, String value, {bool isGreen = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: isGreen ? Color(0xFFEBF7E2) : Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.sfProTextLight(
              fontSize: 12.sp,
              color: AppColors.greyColor,
            ),
          ),
          4.h.verticalSpace,
          Text(
            value,
            style: AppTextStyles.poppinsDisplayMedium(
              fontSize: 18.sp,
              color: isGreen ? AppColors.primaryColor : AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWalletCard() {
    return AppCard(
      padding: EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(10.r),
      height: 70.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Wallet balance",
                style: AppTextStyles.sfProTextLight(
                  fontSize: 12.sp,
                  color: AppColors.blackColor,
                ),
              ),
              3.h.verticalSpace,
              CustomGradientText(
                text: "₹2,450.00",
                style: AppTextStyles.textStyle18Regular,
                outlineWidth: 0,
                shadows: const [],
              ),
            ],
          ),

          /// Right icon
          Center(
            child: SvgIcon(
              AppAssets.wallet,
              size: 24.sp,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
