import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/app_card.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:bwin_awale_game_app/core/widgets/transaction_card.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:bwin_awale_game_app/screens/wallet/add_money_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

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
                  30.h.verticalSpace,
                  _buildSectionHeader("Transaction history"),
                  _buildTransactionList(),
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
                  shadowOffset: Offset(0, 2.h),
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
                  onTap: () {
                    context.pushNamed(UserAppRoutes.withdrawScreen.name);
                  },
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

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
          Text(
            "See all",
            style: AppTextStyles.sfProTextLight(
              fontSize: 12.sp,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      itemCount: 5,
      separatorBuilder: (context, index) => 15.h.verticalSpace,
      itemBuilder: (context, index) {
        bool isWon = index != 2 && index != 4;
        return TransactionCard(
          title: "Game #GM7841 ${isWon ? 'won' : 'lost'}",
          date: "Today, 2:30 PM",
          amount: "200",
          transactionId: "TXN789456",
          isWon: isWon,
        );
      },
    );
  }
}
