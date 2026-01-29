import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/circular_gradient_button.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_app_bar.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PokerGameScreen extends StatelessWidget {
  const PokerGameScreen({super.key});

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
                  title: "Poker",
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

                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _buildPokerTable(context),
                      _buildPlayerAvatar(
                        "Earline R. Walk",
                        Alignment.topCenter,
                        Colors.grey,
                      ),
                      _buildPlayerAvatar(
                        "John Doe",
                        Alignment.centerLeft,
                        Colors.deepOrange,
                      ),
                      _buildPlayerAvatar(
                        "Jane Smith",
                        Alignment.centerRight,
                        Colors.deepPurple,
                      ),

                      // Your Avatar (Bottom)
                      _buildPlayerAvatar(
                        "You",
                        Alignment.bottomCenter,
                        Colors.green,
                      ),
                      _buildCenterCards(),
                    ],
                  ),
                ),
                _buildActionButtons(),
                20.h.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPokerTable(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(UserAppRoutes.gameResultScreen.name),
      child: Container(
        width: 320.w,
        height: 600.h,
        decoration: BoxDecoration(
          color: const Color(0xFF1B5E20),
          borderRadius: BorderRadius.all(Radius.elliptical(320.w, 600.h)),
          border: Border.all(color: const Color(0xFF333333), width: 10.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerAvatar(String name, Alignment alignment, Color color) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                border: Border.all(color: Colors.white, width: 2.w),
              ),
              child: Icon(Icons.person, color: Colors.white, size: 30.sp),
            ),
            4.h.verticalSpace,
            Text(
              name,
              style: AppTextStyles.sfProTextMedium(
                fontSize: 12.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterCards() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) => _buildCard()),
    );
  }

  Widget _buildCard() {
    return Container(
      width: 40.w,
      height: 60.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: Colors.black12),
      ),
      child: Center(
        child: Icon(Icons.favorite, color: Colors.red, size: 20.sp),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          _buildPokerButton("Fold", Colors.red),
          10.w.horizontalSpace,
          _buildPokerButton("Raise", Colors.amber),
          10.w.horizontalSpace,
          _buildPokerButton("Call", Colors.green),
        ],
      ),
    );
  }

  Widget _buildPokerButton(String label, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 4),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: AppTextStyles.poppinsDisplaySemibold(
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
