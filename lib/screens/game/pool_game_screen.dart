import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/circular_gradient_button.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_app_bar.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PoolGameScreen extends StatelessWidget {
  const PoolGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Jungle Background
          Positioned.fill(
            child: Image.asset(AppAssets.welcomeBackground, fit: BoxFit.cover),
          ),

          SafeArea(
            child: Column(
              children: [
                20.h.verticalSpace,
                CustomAppBar(
                  title: "8 Ball Pool",
                  action: CircularGradientButton(
                    size: 40.w,
                    onTap: () {},
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                ),

                const Spacer(),

                // Score Board
                _buildScoreBoard(),

                40.h.verticalSpace,

                // Pool Table (Horizontal)
                _buildPoolTable(context),

                const Spacer(),

                // Players
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPlayerItem("You", Colors.green),
                      _buildPlayerItem("Earline R. Walk", Colors.grey),
                    ],
                  ),
                ),

                40.h.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreBoard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF3E5AB),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: const Color(0xFFDAA520), width: 2.w),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildScoreColumn("YOU", "1"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              ":",
              style: AppTextStyles.poppinsDisplaySemibold(
                fontSize: 24.sp,
                color: Colors.black,
              ),
            ),
          ),
          _buildScoreColumn("WALK", "0"),
        ],
      ),
    );
  }

  Widget _buildScoreColumn(String name, String score) {
    return Column(
      children: [
        Text(
          name,
          style: AppTextStyles.sfProTextMedium(
            fontSize: 10.sp,
            color: Colors.black54,
          ),
        ),
        Text(
          score,
          style: AppTextStyles.poppinsDisplaySemibold(
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildPoolTable(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(UserAppRoutes.gameResultScreen.name),
      child: Center(
        child: Container(
          width: 380.w,
          height: 220.h,
          decoration: BoxDecoration(
            color: const Color(0xFF1B5E20),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: const Color(0xFF5D2E0B), width: 12.w),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Pockets
              ...List.generate(6, (index) => _buildPocket(index)),
              // Rack of balls
              const Center(
                child: Icon(Icons.blur_on, color: Colors.white, size: 60),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPocket(int index) {
    Alignment alignment;
    switch (index) {
      case 0:
        alignment = Alignment.topLeft;
        break;
      case 1:
        alignment = Alignment.topCenter;
        break;
      case 2:
        alignment = Alignment.topRight;
        break;
      case 3:
        alignment = Alignment.bottomLeft;
        break;
      case 4:
        alignment = Alignment.bottomCenter;
        break;
      case 5:
        alignment = Alignment.bottomRight;
        break;
      default:
        alignment = Alignment.center;
    }
    return Align(
      alignment: alignment,
      child: Container(
        width: 25.w,
        height: 25.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildPlayerItem(String name, Color color) {
    return Column(
      children: [
        Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(color: const Color(0xFFDAA520), width: 2.w),
          ),
          child: Icon(Icons.person, color: Colors.white, size: 30.sp),
        ),
        8.h.verticalSpace,
        Text(
          name,
          style: AppTextStyles.sfProTextMedium(
            fontSize: 12.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
