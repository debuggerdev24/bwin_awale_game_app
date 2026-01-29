import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/providers/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationIconWidget extends StatelessWidget {
  final NotificationType type;
  final double? size;
  final double? iconSize;
  final double? padding;

  const NotificationIconWidget({
    super.key,
    required this.type,
    this.size,
    this.iconSize,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color iconColor;
    String iconData;

    switch (type) {
      case NotificationType.win:
        bgColor = const Color(0xFFB2C8C2);
        iconColor = AppColors.primaryColor;
        iconData = AppAssets.cupicon;
        break;

      case NotificationType.deposit:
        bgColor = const Color(0xFFB2C8C2);
        iconColor = AppColors.primaryColor;
        iconData = AppAssets.wallet;
        break;

      case NotificationType.bonus:
        bgColor = const Color(0xFFF6E8B1);
        iconColor = AppColors.blackColor;
        iconData = AppAssets.bonus;
        break;

      case NotificationType.friend:
        bgColor = const Color(0xFFDAE4E2);
        iconColor = AppColors.primaryColor;
        iconData = AppAssets.freinds;
        break;

      case NotificationType.challenge:
        bgColor = const Color(0xFFFDF1E5);
        iconColor = const Color(0xFFF57C00);
        iconData = AppAssets.cupicon;
        break;

      case NotificationType.kyc:
        bgColor = const Color(0xFFFBEAEA);
        iconColor = const Color(0xFFD32F2F);
        iconData = AppAssets.notification;
        break;

      case NotificationType.loss:
        bgColor = AppColors.transactionLostBg;
        iconColor = AppColors.transactionLost;
        iconData = AppAssets.win; // Reuse win icon but with red/loss colors
        break;
    }

    return Container(
      height: size ?? 60.h,
      width: size ?? 60.w,
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Padding(
        padding: EdgeInsets.all(padding ?? 17.0),
        child: SvgIcon(iconData, size: iconSize ?? 20.sp, color: iconColor),
      ),
    );
  }
}
