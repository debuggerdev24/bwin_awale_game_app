import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_app_bar.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_info_box.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_text_field.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:bwin_awale_game_app/core/widgets/quick_amount_button.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final TextEditingController _amountController = TextEditingController();
  String _selectedMethod = "Bank account";
  final List<String> _quickAmounts = ["100", "500", "1000", "2000"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.h.verticalSpace,
              const CustomAppBar(title: "Withdraw"),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildBalanceSection(),
                      30.h.verticalSpace,
                      _buildAmountSection(),
                      20.h.verticalSpace,
                      _buildQuickAmounts(),
                      30.h.verticalSpace,
                      _buildMethodSection(),
                      30.h.verticalSpace,
                      CustomInfoBox(
                        text:
                            "Processing Time: Bank transfers take 1-2 business days. UPI transfers are instant.",
                      ),
                    ],
                  ),
                ),
              ),
              _buildBottomButton(),
              20.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Available Balance",
          style: AppTextStyles.poppinsDisplayRegular(
            fontSize: 12.sp,
            color: AppColors.blackColor,
          ),
        ),
        12.h.verticalSpace,
        Text(
          "₹2830.00",
          style: AppTextStyles.textStyle24Medium.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildAmountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Withdraw amount",
          style: AppTextStyles.sfProTextRegular(
            fontSize: 15.sp,
            color: Colors.black,
          ),
        ),
        10.h.verticalSpace,
        CustomTextField(
          hintText: "₹ 0",
          controller: _amountController,
          onChanged: (value) => setState(() {}),
        ),
        10.h.verticalSpace,
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _amountController.text = "2830";
              });
            },
            child: Text(
              "Withdraw all",
              style: AppTextStyles.poppinsDisplayRegular(
                fontSize: 15.sp,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAmounts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _quickAmounts.map((amount) {
        return QuickAmountButton(
          amount: amount,
          onTap: () {
            setState(() {
              _amountController.text = amount;
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildMethodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Withdrawal method",
          style: AppTextStyles.sfProTextMedium(
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
        15.h.verticalSpace,
        _buildMethodCard("Bank account", "HDFC ****6789"),
        15.h.verticalSpace,
        _buildMethodCard("UPI", "tenberg@teleworm.com"),
      ],
    );
  }

  Widget _buildMethodCard(String title, String subtitle) {
    bool isSelected = _selectedMethod == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = title;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE6EDEB) : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xFFB2C8C2), width: 1.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              padding: EdgeInsets.all(14.w),
              decoration: const BoxDecoration(
                color: Color(0xFFB2C8C2),
                shape: BoxShape.circle,
              ),
              child: SvgIcon(
                AppAssets.wallet,
                color: AppColors.primaryColor,
                size: 20.sp,
              ),
            ),
            15.w.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.sfProTextRegular(
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  4.h.verticalSpace,
                  Text(
                    subtitle,
                    style: AppTextStyles.sfProTextRegular(
                      fontSize: 14.sp,
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

  Widget _buildBottomButton() {
    return Opacity(
      opacity: _amountController.text.isNotEmpty ? 1.0 : 0.3,
      child: AppButton(
        text:
            "Withdraw ₹${_amountController.text.isEmpty ? '0' : _amountController.text}",
        onTap: _amountController.text.isNotEmpty
            ? () {
                context.pushNamed(UserAppRoutes.withdrawSuccessScreen.name);
              }
            : () {},
      ),
    );
  }
}
