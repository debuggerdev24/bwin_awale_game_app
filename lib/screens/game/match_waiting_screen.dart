import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/circular_gradient_button.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

class MatchWaitingScreen extends StatefulWidget {
  const MatchWaitingScreen({super.key});

  @override
  State<MatchWaitingScreen> createState() => _MatchWaitingScreenState();
}

class _MatchWaitingScreenState extends State<MatchWaitingScreen> {
  int _secondsRemaining = 2;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer?.cancel();
        // For now, navigate to Awale as default
        context.pushReplacementNamed(UserAppRoutes.gameAwale.name);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          
          Positioned.fill(
            child: Image.asset(AppAssets.welcomeBackground, fit: BoxFit.cover),
          ),

          SafeArea(
            child: Column(
              children: [
                20.h.verticalSpace,

                const Spacer(),
                _buildTimerCircle(),
                50.h.verticalSpace,
                _buildMatchDetailsBox(),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimerCircle() {
    return Container(
      width: 230.w,
      height: 230.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.match),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: CustomGradientText(
        text: "$_secondsRemaining",
        style: AppTextStyles.sfProDisplayBold(fontSize: 48.sp),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFAF3BC), Color(0xFFFCC524)],
        ),
        outlineColor: const Color(0xFF064E3B),
        outlineWidth: 1.0,
        shadows: const [
          Shadow(offset: Offset(0, 1), color: Color(0xFF064E3B)),
          Shadow(offset: Offset(0.5, 1), color: Color(0xFF064E3B)),
        ],
      ),
    );
  }

  Widget _buildMatchDetailsBox() {
    return Container(
      width: 420.w,
      height: 266.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.cardbord), 
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          80.h.verticalSpace,

          /// Title
          Text(
            "Match details",
            style: AppTextStyles.sfProTextMedium(
              fontSize: 14.sp,
              color: const Color(0xFFF3E5AB),
            ),
          ),

          20.h.verticalSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPlayerIcon(
                name: "Paul L.",
                icon: AppAssets.game,
                bgColor: const Color(0xFF2E7D32),
                shadowColor: const Color(0xFF1B5E20),
              ),
              40.w.horizontalSpace,
              _buildTrophyMiddle(),
              40.w.horizontalSpace,
              _buildPlayerIcon(
                name: "Randolph L.",
                icon: AppAssets.goal,
                bgColor: const Color(0xFFC62828),
                shadowColor: AppColors.blackColor,
              ),
            ],
          ),
          const Spacer(),

          /// Bet amount
          Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outline,
                  size: 16.sp,
                  color: const Color(0xFFF3E5AB),
                ),
                8.w.horizontalSpace,
                CustomGradientText(
                  text: "Bet amount: ₹200 each",
                  style: AppTextStyles.sfProTextRegular(fontSize: 12.sp),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFAF3BC), Color(0xFFFCC524)],
                  ),
                  shadows: const [
                    Shadow(offset: Offset(0, 0.5), color: Color(0xFF7A4E25)),
                  ],
                  outlineWidth: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerIcon({
    required String name,
    required String icon,
    required Color bgColor,
    required Color shadowColor,
  }) {
    return Column(
      children: [
        CircularGradientButton(
          onTap: () {},
          color: bgColor,
          shadows: [
            BoxShadow(
              color: shadowColor,
              offset: Offset(0, 3.h),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
          border: Border.all(color: shadowColor, width: 1.w),
          child: SvgIcon(icon),
        ),
        4.h.verticalSpace,
        Text(
          name,
          style: AppTextStyles.sfProTextRegular(
            fontSize: 12.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildTrophyMiddle() {
    return Column(
      children: [
        SvgIcon(AppAssets.cupicon, size: 30.sp, color: const Color(0xFFF3E5AB)),
        6.h.verticalSpace,
        Text(
          "₹380",
          style: AppTextStyles.sfProTextRegular(
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
