import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/app_card.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_app_bar.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              20.h.verticalSpace,
              const CustomAppBar(title: "Invite friends"),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Column(
                    children: [
                      _buildHeaderIcon(),
                      30.h.verticalSpace,
                      Text(
                        "Earn ₹100 per Friend!",
                        style: AppTextStyles.poppinsDisplayMedium(
                          fontSize: 24.sp,
                          color: AppColors.blackColor,
                        ),
                      ),
                      8.h.verticalSpace,
                      Text(
                        "Invite friends and earn bonus when they join and make\ntheir first deposit",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.sfProTextRegular(
                          fontSize: 13.sp,
                          color: AppColors.greyColor,
                        ),
                      ),
                      30.h.verticalSpace,
                      _buildReferralCodeCard(context),
                      30.h.verticalSpace,
                      _buildReferralLinkBox(context),
                      30.h.verticalSpace,
                      AppButton(text: "Share on WhatsApp", onTap: () {}),
                      12.h.verticalSpace,
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 55.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            "Share via link",
                            style: AppTextStyles.sfProTextMedium(
                              fontSize: 16.sp,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      40.h.verticalSpace,
                      _buildHowItWorks(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderIcon() {
    return Container(
      width: 120.w,
      height: 120.h,
      decoration: const BoxDecoration(
        color: AppColors.backButtonBackgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgIcon(
          AppAssets.bonus,
          size: 50.sp,
          color: AppColors.blackColor,
        ),
      ),
    );
  }

  Widget _buildReferralCodeCard(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.all(11.w),
      color: AppColors.backButtonBackgroundColor,
      borderColor: AppColors.backButtonBorderColor,
      shadowColor: AppColors.backButtonShadowColor,
      child: Column(
        children: [
          Text(
            "Your referral code",
            style: AppTextStyles.sfProTextLight(
              fontSize: 12.sp,
              color: AppColors.blackColor,
            ),
          ),
          6.h.verticalSpace,
          CustomGradientText(
            text: "BWIN202GXYZ",
            style: AppTextStyles.textStyle14Medium.copyWith(fontSize: 24.sp),
            outlineWidth: 0,
            shadows: const [],
          ),
          15.h.verticalSpace,
          GestureDetector(
            onTap: () {},
            child: AppCard(
              shadowOffset: Offset(0, 1.h),
              shadowColor: AppColors.primaryColor,
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              height: 40.h,
              width: 180.w,
              borderColor: AppColors.primaryColor,
              borderWidth: 0.5,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgIcon(AppAssets.copy),
                  8.w.horizontalSpace,
                  CustomGradientText(
                    letterSpacing: 0,
                    text: "Copy code",
                    style: AppTextStyles.textStyle16Regular.copyWith(),
                    outlineWidth: 0,
                    shadows: const [],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReferralLinkBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Referral link",
            style: AppTextStyles.sfProTextMedium(
              fontSize: 14.sp,
              color: AppColors.blackColor,
            ),
          ),
          10.h.verticalSpace,
          AppCard(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
            color: AppColors.backButtonBackgroundColor,
            borderColor: AppColors.backButtonBorderColor,
            shadowColor: AppColors.backButtonShadowColor,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "https://bwin.game/ref=bwin202...",
                    style: AppTextStyles.sfProTextRegular(
                      fontSize: 14.sp,
                      color: AppColors.greyColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(
                      const ClipboardData(
                        text: "https://bwin.game/ref=bwin202GXYZ",
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Link copied to clipboard")),
                    );
                  },
                  child: Icon(
                    Icons.copy,
                    size: 20.sp,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorks() {
    final steps = [
      {"title": "Invite Friends", "subtitle": "Share your referral link"},
      {"title": "Friend Signs Up", "subtitle": "They create a new account"},
      {"title": "First Deposit", "subtitle": "They add money to wallet"},
      {"title": "You Both Win", "subtitle": "You get ₹100, they get ₹50"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "How it works",
          style: AppTextStyles.sfProTextMedium(
            fontSize: 16.sp,
            color: AppColors.blackColor,
          ),
        ),
        20.h.verticalSpace,
        ...steps.asMap().entries.map((entry) {
          int idx = entry.key;
          var step = entry.value;
          return Padding(
            padding: EdgeInsets.only(bottom: 25.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 28.w,
                      height: 28.h,
                      decoration: const BoxDecoration(
                        color: AppColors.buttonGradientStart,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "${idx + 1}",
                          style: AppTextStyles.sfProTextBold(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    if (idx != steps.length - 1)
                      Container(
                        width: 2.w,
                        height: 30.h,
                        color: AppColors.buttonGradientStart.withOpacity(0.3),
                      ),
                  ],
                ),
                15.w.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        step["title"]!,
                        style: AppTextStyles.sfProTextMedium(
                          fontSize: 14.sp,
                          color: AppColors.blackColor,
                        ),
                      ),
                      4.h.verticalSpace,
                      Text(
                        step["subtitle"]!,
                        style: AppTextStyles.sfProTextRegular(
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
        }).toList(),
      ],
    );
  }
}
