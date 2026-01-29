import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_app_bar.dart';
import 'package:bwin_awale_game_app/core/widgets/notification_icon.dart';
import 'package:bwin_awale_game_app/providers/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            20.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const CustomAppBar(title: "Notification"),
            ),
            _buildSubHeader(context),
            Expanded(child: _buildNotificationList(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildSubHeader(BuildContext context) {
    final unreadCount = context.watch<NotificationProvider>().unreadCount;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$unreadCount unread notification",
            style: AppTextStyles.sfProTextLight(
              fontSize: 12.sp,
              color: AppColors.blackColor,
            ),
          ),
          GestureDetector(
            onTap: () => context.read<NotificationProvider>().markAllAsRead(),
            child: Text(
              "Mark all as read",
              style: AppTextStyles.sfProTextRegular(
                fontSize: 16.sp,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationList(BuildContext context) {
    final notifications = context.watch<NotificationProvider>().notifications;

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      itemCount: notifications.length,
      separatorBuilder: (context, index) => 15.h.verticalSpace,
      itemBuilder: (context, index) {
        return _buildNotificationItem(context, notifications[index]);
      },
    );
  }

  Widget _buildNotificationItem(
    BuildContext context,
    NotificationItemData data,
  ) {
    return GestureDetector(
      onTap: () => context.read<NotificationProvider>().markAsRead(data.id),
      child: Container(
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          color: data.isUnread ? Color(0xFFE6EDEB) : Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: data.isUnread ? Color(0xFFB2C8C2) : Color(0xFFE0E0E0),
            width: 1.w,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NotificationIconWidget(type: data.type),
            15.w.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.title,
                        style: AppTextStyles.poppinsDisplayRegular(
                          fontSize: 16.sp,
                          color: AppColors.blackColor,
                        ),
                      ),
                      if (data.isUnread)
                        Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  5.h.verticalSpace,
                  Text(
                    data.description,
                    style: AppTextStyles.sfProTextRegular(
                      fontSize: 14.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                  10.h.verticalSpace,
                  Text(
                    data.time,
                    style: AppTextStyles.sfProTextLight(
                      fontSize: 12.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
