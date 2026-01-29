import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/app_card.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader("", showSeeAll: false),
                  _buildGameCategories(context),
                  _buildSectionHeader("Active game"),
                  _buildActiveGameList(),
                  20.h.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 0),
      color: AppColors.primaryColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back,",
                    style: AppTextStyles.sfProTextLight(
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                  ),
                  10.h.verticalSpace,
                  CustomGradientText(
                    text: "Paul L. Petty john",
                    style: AppTextStyles.textStyle18Medium,
                    outlineWidth: 0,
                    shadows: const [],
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pushNamed(
                      UserAppRoutes.notificationScreen.name,
                    ),
                    child: _buildHeaderActionIcon(AppAssets.notification),
                  ),
                  15.w.horizontalSpace,
                  _buildHeaderActionIcon(AppAssets.play),
                ],
              ),
            ],
          ),
          _buildBalanceCard(context),
        ],
      ),
    );
  }

  Widget _buildHeaderActionIcon(String icon) {
    return AppCard(
      width: 60.w,
      height: 60.h,
      padding: EdgeInsets.all(12.w),
      borderRadius: BorderRadius.circular(12.r),
      child: Center(
        child: SvgIcon(icon, size: 24.sp, color: AppColors.primaryColor),
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    return AppCard(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      padding: EdgeInsets.all(10.w),
      borderRadius: BorderRadius.circular(15.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Wallet balance",
                style: AppTextStyles.sfProTextLight(
                  fontSize: 14.sp,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SvgIcon(AppAssets.wallet, size: 24.sp, color: Colors.black87),
            ],
          ),
          10.h.verticalSpace,
          CustomGradientText(
            style: AppTextStyles.textStyle18Medium,
            outlineWidth: 0,
            shadows: const [],
            text: "₹2,450.00",
          ),
          20.h.verticalSpace,
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: "Add money",
                  onTap: () {
                    context.pushNamed(UserAppRoutes.addmoneyScreen.name);
                  },
                  height: 50.h,
                  textStyle: AppTextStyles.poppinsDisplayMedium(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              15.w.horizontalSpace,
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 48.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: AppColors.buttonGradientEnd,
                        width: 0.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryColor,
                          offset: Offset(0, 2.h),
                          blurRadius: 0,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: CustomGradientText(
                      text: "Withdraw",
                      style: AppTextStyles.textStyle14Regular,
                      outlineWidth: 0,
                      shadows: const [],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, {bool showSeeAll = true}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.poppinsDisplayMedium(
              fontSize: 18.sp,
              color: Colors.black,
            ),
          ),
          if (showSeeAll)
            Text(
              "See all",
              style: AppTextStyles.sfProTextLight(
                fontSize: 12.sp,
                color: AppColors.greyColor,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildGameCategories(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          _buildGameCategoryCard(
            "Awale",
            AppAssets.awale,
            onTap: () =>
                context.pushNamed(UserAppRoutes.matchWaitingScreen.name),
          ),
          10.w.horizontalSpace,
          _buildGameCategoryCard(
            "Poker",
            AppAssets.pocker,
            onTap: () => context.pushNamed(UserAppRoutes.gamePoker.name),
          ),
          10.w.horizontalSpace,
          _buildGameCategoryCard(
            "8 ball pool",
            AppAssets.ballpool,
            onTap: () => context.pushNamed(UserAppRoutes.gamePool.name),
          ),
        ],
      ),
    );
  }

  Widget _buildGameCategoryCard(
    String title,
    String image, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 123.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F7),
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 50.h, width: 50.w),
            5.h.verticalSpace,
            Text(
              title,
              style: AppTextStyles.sfProTextRegular(
                fontSize: 12.sp,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveGameList() {
    final List<String> opponents = [
      "Carl E. Zamorano",
      "Mildred D. Barker",
      "Edward R. Mason",
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: opponents.length,
      separatorBuilder: (context, index) => 15.h.verticalSpace,
      itemBuilder: (context, index) =>
          _buildActiveGameItem(context, opponents[index], index == 2),
    );
  }

  Widget _buildActiveGameItem(
    BuildContext context,
    String opponent,
    bool isWaiting,
  ) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 4.h),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildGameInfoColumn("Game #GM7841", "vs $opponent"),
              _buildGameInfoColumn("Bet amount", "₹200", isEnd: true),
            ],
          ),
          15.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isWaiting ? "Waiting" : "Your turn",
                style: AppTextStyles.sfProTextRegular(
                  fontSize: 12.sp,
                  color: AppColors.greyColor,
                ),
              ),
              if (!isWaiting)
                GestureDetector(
                  onTap: () {
                    context.pushNamed(UserAppRoutes.createBetScreen.name);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: 30.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCECDE),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Center(
                      child: CustomGradientText(
                        textAlign: TextAlign.center,
                        text: "Play now",
                        style: AppTextStyles.sfProTextLight(fontSize: 12.sp),
                        outlineWidth: 0,
                        shadows: const [],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGameInfoColumn(
    String label,
    String value, {
    bool isEnd = false,
  }) {
    return Column(
      crossAxisAlignment: isEnd
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.sfProTextLight(
            fontSize: 12.sp,
            color: AppColors.greyColor,
          ),
        ),
        isEnd
            ? CustomGradientText(
                text: value,
                style: AppTextStyles.sfProTextRegular(fontSize: 16.sp),
                outlineWidth: 0,
                shadows: const [],
              )
            : Text(
                value,
                style: AppTextStyles.sfProTextMedium(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
      ],
    );
  }
}
