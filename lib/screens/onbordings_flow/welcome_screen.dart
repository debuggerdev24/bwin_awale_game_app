import 'dart:math' as math;
import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/arched_text.dart';
import 'package:bwin_awale_game_app/core/widgets/feature_card.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox.expand(),
          Positioned.fill(
            child: Image.asset(AppAssets.welcomeBackground, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.3)],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          SizedBox(height: 30.h),
                          Image.asset(
                            AppAssets.win,
                            width: 100.w,
                            height: 100.h,
                          ),
                          SizedBox(height: 40.h),
                          // Title
                          ArchedText(
                            text: "Welcome to Bwin",
                            radius: 400.r,
                            height: 50.h,
                            startAngle: -math.pi / 2,
                            letterSpacing: 0.5.sp,

                            textStyle: AppTextStyles.textStyle32Bold.copyWith(
                              fontSize: 37.sp,
                            ),
                            outlineColor: AppColors.primaryColor,
                            outlineWidth: 3.w,
                            shadows: [
                              Shadow(
                                color: AppColors.primaryColor,
                                offset: Offset(0, 1.h),
                                blurRadius: 0,
                              ),
                              Shadow(
                                color: AppColors.primaryColor,
                                offset: Offset(0.5.w, 0),
                                blurRadius: 0,
                              ),
                            ],
                            gradient: const LinearGradient(
                              colors: [
                                AppColors.titleGoldLight,
                                AppColors.titleGoldDark,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          10.h.verticalSpace,
                          Stack(
                            children: [
                              // Outline and Shadows
                              Text(
                                "The traditional game, Now with real\nmoney betting",
                                textAlign: TextAlign.center,
                                style: AppTextStyles.textStyle16Regular
                                    .copyWith(
                                      fontSize: 16.5.sp,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 0.5.w
                                        ..color =
                                            AppColors.subtitleOutlineColor,
                                      shadows: [
                                        Shadow(
                                          color: AppColors.subtitleShadowColor,
                                          offset: Offset(0, 1.h),
                                          blurRadius: 0,
                                        ),
                                        Shadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 2.h),
                                          blurRadius: 3,
                                        ),
                                      ],
                                    ),
                              ),
                              // Main Text
                              Text(
                                "The traditional game, Now with real\nmoney betting",
                                textAlign: TextAlign.center,
                                style: AppTextStyles.textStyle16Regular
                                    .copyWith(
                                      color: AppColors.subtitleColor,
                                      fontSize: 16.5.sp,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40.h),
                          // Features List
                          const FeatureCard(
                            imagePath: AppAssets.cup,
                            title: "Win real money",
                            subtitle: "Challenge friends and win cash prizes",
                          ),
                          SizedBox(height: 20.h),
                          const FeatureCard(
                            imagePath: AppAssets.playwithfriends,
                            title: "Play with friends",
                            subtitle: "Invite friends and compete together",
                          ),
                          SizedBox(height: 20.h),
                          const FeatureCard(
                            imagePath: AppAssets.instantpayout,
                            title: "Instant payouts",
                            subtitle:
                                "Withdraw winnings instantly to your bank",
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: AppButton(
                    text: "Get started",
                    onTap: () {
                      context.pushNamed(
                        UserAppRoutes.ageVerificationScreen.name,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
