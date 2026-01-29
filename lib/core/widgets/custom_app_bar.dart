import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackTap;
  final Widget? action;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackTap,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomBackButton(onTap: onBackTap ?? () => Navigator.pop(context)),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.poppinsDisplayMedium(
                fontSize: 18.sp,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ),
        action ?? SizedBox(width: 64.w),
      ],
    );
  }
}
