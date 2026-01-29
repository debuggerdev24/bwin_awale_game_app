import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/circular_gradient_button.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_app_bar.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_back_button.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AwaleGameScreen extends StatelessWidget {
  const AwaleGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.welcomeBackground, fit: BoxFit.cover),
          ),
          SafeArea(
            child: Column(
              children: [
                20.h.verticalSpace,
                _buildHeader(context),
                40.h.verticalSpace,

                // Opponent
                _buildPlayerInfo(
                  name: "Randolph L.",
                  role: "Opponent",
                  icon: AppAssets.goal,
                  bgColor: const Color(0xFFC62828),
                  shadowColor: Colors.black,
                  seeds: "08",
                  isTop: true,
                ),

                const Spacer(),

                // Wooden Board
                _buildAwaleBoard(context),

                const Spacer(),

                // You
                _buildPlayerInfo(
                  name: "Randolph L.",
                  role: "You",
                  icon: AppAssets.game,
                  bgColor: const Color(0xFF2E7D32),
                  shadowColor: Colors.black,
                  seeds: "12",
                  isTop: false,
                ),

                40.h.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppButton(
            height: 40.h,
            width: 110.w,
            text: "₹380 POT",
            textStyle: AppTextStyles.sfProTextRegular(
              fontSize: 14.sp,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          CustomBackButton(
            icon: AppAssets.close,
            onTap: () {
              context.pushNamed(
                UserAppRoutes.gameResultScreen.name,
                extra: false,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerInfo({
    required String name,
    required String role,
    required String icon,
    required Color bgColor,
    required Color shadowColor,
    required String seeds,
    required bool isTop,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircularGradientButton(
                size: 50.w,
                onTap: () {},
                color: bgColor,
                shadows: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    offset: Offset(0, 3.h),
                    blurRadius: 0,
                    spreadRadius: 0,
                  ),
                ],
                child: SvgIcon(icon, size: 24.sp),
              ),
              15.w.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.textStyle18Medium.copyWith(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),

                  Text(
                    role,
                    style: AppTextStyles.sfProTextLight(
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                seeds,
                style: AppTextStyles.sfProTextMedium(
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
              ),
              Text(
                "Seeds",
                style: AppTextStyles.sfProTextRegular(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAwaleBoard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(UserAppRoutes.gameResultScreen.name, extra: true);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 90.h),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(AppAssets.playbord),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(40.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }
}
