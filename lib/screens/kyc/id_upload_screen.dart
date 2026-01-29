import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_app_bar.dart';
import 'package:bwin_awale_game_app/core/widgets/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class IdUploadScreen extends StatefulWidget {
  const IdUploadScreen({super.key});

  @override
  State<IdUploadScreen> createState() => _IdUploadScreenState();
}

class _IdUploadScreenState extends State<IdUploadScreen> {
  String _selectedIdType = "Aadhar card";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 25.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(text: "Confirm & Continue", onTap: () {}),
            16.h.verticalSpace,
            GestureDetector(
              onTap: () => context.pop(),
              child: Text(
                "Back to list",
                style: AppTextStyles.textStyle14Regular.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.h.verticalSpace,
                const CustomAppBar(title: "ID upload"),
                30.h.verticalSpace,
                Row(
                  children: [
                    _buildIdTypeButton("Aadhar card"),
                    SizedBox(width: 10.w),
                    _buildIdTypeButton("PAN card"),
                    SizedBox(width: 10.w),
                    _buildIdTypeButton("Voter ID"),
                  ],
                ),
                30.h.verticalSpace,
                Text(
                  "Upload ID card",
                  style: AppTextStyles.textStyle16Regular.copyWith(
                    color: Colors.black,
                  ),
                ),
                10.h.verticalSpace,
                _buildUploadBox(
                  title: "Upload front",
                  subtitle: "PDF, JPG, PNG supported. Max size 5MB.",
                ),
                20.h.verticalSpace,
                _buildUploadBox(
                  title: "Upload back",
                  subtitle: "PDF, JPG, PNG supported. Max size 5MB.",
                ),
                30.h.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIdTypeButton(String title) {
    final bool isSelected = _selectedIdType == title;
    return Expanded(
      child: AppButton(
        text: title,
        height: 65.h,
        onTap: () {
          setState(() => _selectedIdType = title);
        },
        gradient: isSelected
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.buttonGradientStart,
                  AppColors.buttonGradientEnd,
                ],
              )
            : null,
        color: isSelected ? null : AppColors.backButtonBackgroundColor,
        borderColor: isSelected
            ? AppColors.primaryColor
            : AppColors.backButtonBorderColor,
        borderWidth: isSelected ? 0 : 2,
        shadowColor: isSelected
            ? AppColors.primaryColor
            : AppColors.backButtonShadowColor,
        textStyle: AppTextStyles.textStyle14Regular.copyWith(
          color: isSelected ? Colors.white : AppColors.secondaryColor,
        ),
      ),
    );
  }

  Widget _buildUploadBox({required String title, required String subtitle}) {
    return DashedContainer(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      width: double.infinity,
      height: 100.h,
      borderRadius: 10,
      borderColor: const Color(0xFFDAE4E2),
      shadowColor: const Color(0xFFB2C8C2).withOpacity(0.4),
      child: Row(
        children: [
          SvgIcon(AppAssets.upload, size: 24.sp),
          15.w.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyles.textStyle14Regular.copyWith(
                    color: Colors.black,
                  ),
                ),
                10.h.verticalSpace,
                Text(
                  subtitle,
                  style: AppTextStyles.sfProTextLight(
                    fontSize: 12.sp,
                    color: Color(0xFF606060),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16.sp,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
