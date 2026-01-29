import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_app_bar.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_text_field.dart';
import 'package:bwin_awale_game_app/core/widgets/quick_amount_button.dart';
import 'package:bwin_awale_game_app/screens/wallet/deposit_successful_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({super.key});

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  final TextEditingController _amountController = TextEditingController();
  String _selectedPaymentMethod = "UPI";

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
              const CustomAppBar(title: "Add money"),
              30.h.verticalSpace,
              _buildAmountInput(),
              20.h.verticalSpace,
              _buildQuickAmounts(),
              30.h.verticalSpace,
              _buildPaymentMethods(),
              const Spacer(),
              Opacity(
                opacity: _amountController.text.isNotEmpty ? 1.0 : 0.3,
                child: AppButton(
                  text:
                      "Add ₹${_amountController.text.isEmpty ? '0' : _amountController.text}",
                  onTap: _amountController.text.isNotEmpty
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DepositSuccessfulScreen(
                                amount: "₹${_amountController.text}.00",
                                paymentMethod: _selectedPaymentMethod,
                              ),
                            ),
                          );
                        }
                      : () {},
                ),
              ),
              20.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountInput() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter amount",
            style: AppTextStyles.sfProTextRegular(
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
          10.h.verticalSpace,
          CustomTextField(
            hintText: "₹0",
            controller: _amountController,
            onChanged: (value) => setState(() {}),
          ),
        ],
      ),
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

  Widget _buildPaymentMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment method",
          style: AppTextStyles.sfProTextMedium(
            fontSize: 15.sp,
            color: Colors.black,
          ),
        ),
        15.h.verticalSpace,
        _buildPaymentOption(
          "UPI",
          "Google pay, PhonePe, Paytm",
          AppAssets.wallet,
          isSelected: _selectedPaymentMethod == "UPI",
        ),
        15.h.verticalSpace,
        _buildPaymentOption(
          "Credit / Debit card",
          "Visa, Mastercard, RuPay",
          AppAssets.wallet,
          isSelected: _selectedPaymentMethod == "Card",
        ),
      ],
    );
  }

  Widget _buildPaymentOption(
    String title,
    String subtitle,
    String icon, {
    bool isSelected = false,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = title.contains("UPI") ? "UPI" : "Card";
        });
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFE6EDEB) : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Color(0xFFB2C8C2), width: 1.w),
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
              padding: EdgeInsets.all(6.w),
              decoration: const BoxDecoration(
                color: Color(0xFFB2C8C2),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgIcon(
                  icon,
                  color: AppColors.primaryColor,
                  size: 24.sp,
                ),
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
            if (isSelected)
              SvgIcon(
                AppAssets.select,
                color: AppColors.primaryColor,
                size: 18.sp,
              ),
          ],
        ),
      ),
    );
  }
}
