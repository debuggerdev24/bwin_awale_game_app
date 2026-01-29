import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imagePath;
  final IconData? icon;
  final Color? iconColor;

  const FeatureCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.imagePath,
    this.icon,
    this.iconColor,
  }) : assert(
         imagePath != null || icon != null,
         'Either imagePath or icon must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return AppCard(
      height: 70.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          if (imagePath != null)
            Image.asset(
              imagePath!,
              width: 50.w,
              height: 50.h,
              fit: BoxFit.contain,
            )
          else
            Icon(icon, color: iconColor ?? AppColors.primaryColor, size: 30.sp),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyles.textStyle14Regular.copyWith(
                    fontSize: 15.sp,
                    color: AppColors.featureTitleColor,
                    shadows: [
                      Shadow(
                        color: AppColors.featureTitleShadowColor.withOpacity(
                          0.7,
                        ),
                        offset: const Offset(0.5, 0),
                        blurRadius: 0.5,
                      ),
                      Shadow(
                        color: AppColors.featureTitleShadowColor.withOpacity(
                          0.7,
                        ),
                        offset: const Offset(0, -0.5),
                        blurRadius: 0.5,
                      ),
                      Shadow(
                        color: AppColors.featureTitleShadowColor.withOpacity(
                          0.3,
                        ),
                        offset: const Offset(-0.4, 0),
                        blurRadius: 0.5,
                      ),
                      Shadow(
                        color: AppColors.featureTitleShadowColor.withOpacity(
                          0.7,
                        ),
                        offset: const Offset(0, 0.4),
                        blurRadius: 0.5,
                      ),
                    ],
                  ),
                ),
                Text(
                  subtitle,
                  style: AppTextStyles.textStyle14Regular.copyWith(
                    color: AppColors.subtitleShadowColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
