import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_back_button.dart';
import 'package:bwin_awale_game_app/core/widgets/skip_button.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _onboardingData = [
    OnboardingData(image: AppAssets.onboarding1),
    OnboardingData(image: AppAssets.onboarding2),
    OnboardingData(image: AppAssets.onboarding3),
  ];

  void _onNext() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.pushNamed(UserAppRoutes.welcomeScreen.name);
    }
  }

  void _onBack() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onSkip() {
    context.pushNamed(UserAppRoutes.welcomeScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return OnboardingPage(data: _onboardingData[index]);
            },
          ),
          Positioned(
            top: 70.h,
            right: 20.w,
            child: SkipButton(onTap: _onSkip),
          ),
          Positioned(
            bottom: 40.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0) ...[
                  CustomBackButton(
                    onTap: _onBack,
                    icon: AppAssets.backArrow,
                    iconSize: 22.sp,
                    height: 70.h,
                    width: 70.w,
                  ),
                  SizedBox(width: 12.w),
                ],
                Expanded(
                  child: AppButton(text: "Next", onTap: _onNext),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String image;

  OnboardingData({required this.image});
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(data.image, fit: BoxFit.cover)),
        // Gradient overlay for better text readability
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.transparent,
                  Colors.black.withOpacity(0.6),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
