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

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: Stack(
              children: [_buildFriendsList(), _buildAddButton(context)],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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
              10.h.verticalSpace,
              CustomGradientText(
                text: "Paul L. Petty john",
                style: AppTextStyles.textStyle18Medium,
                outlineWidth: 0,
                shadows: const [],
              ),
            ],
          ),
          GestureDetector(
            onTap: () =>
                context.pushNamed(UserAppRoutes.notificationScreen.name),
            child: AppCard(
              width: 50.w,
              height: 50.h,
              padding: EdgeInsets.all(12.w),
              borderRadius: BorderRadius.circular(12.r),
              child: Center(
                child: SvgIcon(
                  AppAssets.notification,
                  size: 24.sp,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFriendsList() {
    final friends = [
      {"name": "Brett B. Bushnell", "time": "42 mins"},
      {"name": "John S. Martin", "time": "51 mins"},
      {"name": "Gregory L. Fulmer", "time": "02 mins"},
      {"name": "Monica S. Reddick", "time": "1.2 hrs"},
      {"name": "Larry L. Wilson", "time": "25 mins"},
      {"name": "Vivian S. Millard", "time": "8 hrs"},
    ];

    return ListView.separated(
      padding: EdgeInsets.all(20.w),
      itemCount: friends.length,
      separatorBuilder: (context, index) => 15.h.verticalSpace,
      itemBuilder: (context, index) {
        return _buildFriendCard(friends[index]);
      },
    );
  }

  Widget _buildFriendCard(Map<String, String> friend) {
    return AppCard(
      shadowColor: Colors.black.withOpacity(0.1),

      color: Colors.white,
      shadowOffset: Offset(0, 0.h),
      padding: EdgeInsets.all(12.w),
      borderColor: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(12.r),
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Text(
                friend["name"]!.split(' ').map((e) => e[0]).take(2).join(''),
                style: AppTextStyles.sfProTextBold(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          15.w.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  friend["name"]!,
                  style: AppTextStyles.poppinsDisplayRegular(
                    fontSize: 14.sp,
                    color: AppColors.blackColor,
                  ),
                ),
                4.h.verticalSpace,
                Row(
                  children: [
                    SvgIcon(
                      AppAssets.cupicon,
                      size: 14.sp,
                      color: AppColors.greyColor,
                    ),
                    10.w.horizontalSpace,
                    Text(
                      friend["time"]!,
                      style: AppTextStyles.sfProTextLight(
                        fontSize: 12.sp,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppButton(
            width: 120.w,
            height: 40.h,
            borderRadius: 8.r,
            shadowOffset: Offset(0, 2.h),
            text: "Challenge",
            onTap: () {},
            textStyle: AppTextStyles.sfProTextMedium(
              fontSize: 12.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return Positioned(
      bottom: 20.h,
      right: 20.w,
      child: GestureDetector(
        onTap: () {
          context.pushNamed(UserAppRoutes.inviteFriendsScreen.name);
        },
        child: AppButton(
          width: 65.w,
          height: 65.h,
          borderRadius: 12.r,
          shadowOffset: Offset(0, 4.h),
          text: "+",
          onTap: () {
            context.pushNamed(UserAppRoutes.inviteFriendsScreen.name);
          },
        ),
      ),
    );
  }
}
