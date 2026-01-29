import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/app_card.dart';
import 'package:bwin_awale_game_app/core/widgets/arena_card.dart';
import 'package:bwin_awale_game_app/core/widgets/tournament_card.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ArenaScreen extends StatefulWidget {
  const ArenaScreen({super.key});

  @override
  State<ArenaScreen> createState() => _ArenaScreenState();
}

class _ArenaScreenState extends State<ArenaScreen> {
  bool isLiveArena = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          _buildHeader(),
          _buildToggle(),
          Expanded(
            child: isLiveArena
                ? _buildLiveArenaList()
                : _buildTournamentsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 20.h),
      color: AppColors.primaryColor,
      child: Row(
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
              8.h.verticalSpace,
              CustomGradientText(
                text: "Paul L. Petty john",
                style: AppTextStyles.textStyle18Medium,
                outlineWidth: 0,
                shadows: const [],
              ),
            ],
          ),
          AppCard(
            width: 60.w,
            height: 60.h,
            padding: EdgeInsets.all(12.w),
            borderRadius: BorderRadius.circular(12.r),
            child: const Center(
              child: SvgIcon(
                AppAssets.notification,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              text: "Live arena",
              onTap: () => setState(() => isLiveArena = true),
              height: 60.h,
              gradient: isLiveArena
                  ? const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.buttonGradientStart,
                        AppColors.buttonGradientEnd,
                      ],
                    )
                  : null,
              color: isLiveArena ? null : AppColors.backButtonBackgroundColor,
              borderColor: isLiveArena
                  ? AppColors.primaryColor
                  : AppColors.backButtonBorderColor,
              shadowColor: isLiveArena
                  ? AppColors.primaryColor
                  : AppColors.backButtonShadowColor,
              textStyle: AppTextStyles.sfProTextMedium(
                fontSize: 14.sp,
                color: isLiveArena ? Colors.white : AppColors.secondaryColor,
              ),
            ),
          ),
          15.w.horizontalSpace,
          Expanded(
            child: AppButton(
              text: "Tournaments",
              onTap: () => setState(() => isLiveArena = false),
              height: 60.h,
              gradient: !isLiveArena
                  ? const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.buttonGradientStart,
                        AppColors.buttonGradientEnd,
                      ],
                    )
                  : null,
              color: !isLiveArena ? null : AppColors.backButtonBackgroundColor,
              borderColor: !isLiveArena
                  ? AppColors.primaryColor
                  : AppColors.backButtonBorderColor,
              shadowColor: !isLiveArena
                  ? AppColors.primaryColor
                  : AppColors.backButtonShadowColor,
              textStyle: AppTextStyles.sfProTextMedium(
                fontSize: 14.sp,
                color: !isLiveArena ? Colors.white : AppColors.secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveArenaList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: 3,
      itemBuilder: (context, index) {
        return ArenaCard(
          league: index % 2 == 0 ? "Master league" : "Elite league",
          name: index == 0 ? "Barbara K. Kimura" : "Janet V. Smith",
          initials: index == 0 ? "BK" : "JV",
          prize: "380",
          bet: "200",
          onJoinTap: () {},
        );
      },
    );
  }

  Widget _buildTournamentsList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: 3,
      itemBuilder: (context, index) {
        return TournamentCard(
          league: index == 0
              ? "Grand event"
              : (index == 1 ? "Pro event" : "VIP event"),
          title: "Champion cup",
          time: "Today 09:00 PM",
          participants: "45/100",
          prize: "25,000",
          onRegisterTap: () =>
              context.pushNamed(UserAppRoutes.tournamentDetails.name),
        );
      },
    );
  }
}
