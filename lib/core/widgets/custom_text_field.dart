import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    this.label,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.prefix,
    this.suffix,
    this.suffixIcon,
    this.hintStyle,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: AppTextStyles.textStyle14Regular.copyWith(
              color: const Color(0xFF110600),
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 8.h),
        ],
        Row(
          children: [
            if (prefix != null) ...[prefix!, SizedBox(width: 8.w)],
            Expanded(
              child: AppCard(
                height: 60.h,
                borderRadius: BorderRadius.circular(12.r),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          keyboardType: keyboardType,
                          obscureText: obscureText,
                          onChanged: onChanged,
                          decoration: InputDecoration(
                            hintText: hintText,
                            hintStyle:
                                hintStyle ??
                                AppTextStyles.textStyle14Regular.copyWith(
                                  color: AppColors.secondaryColor,
                                ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                          style: AppTextStyles.textStyle14Regular.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ),
                      if (suffixIcon != null) suffixIcon!,
                    ],
                  ),
                ),
              ),
            ),
            if (suffix != null) ...[SizedBox(width: 8.w), suffix!],
          ],
        ),
      ],
    );
  }
}
