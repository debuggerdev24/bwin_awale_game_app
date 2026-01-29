import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/app_card.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_app_bar.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_info_box.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_text_field.dart';
import 'package:bwin_awale_game_app/core/widgets/quick_amount_button.dart';
import 'package:bwin_awale_game_app/core/widgets/confirm_bet_dialog.dart';
import 'package:bwin_awale_game_app/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateBetScreen extends StatefulWidget {
  const CreateBetScreen({super.key});

  @override
  State<CreateBetScreen> createState() => _CreateBetScreenState();
}

class _CreateBetScreenState extends State<CreateBetScreen> {
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _amountController.text = context.read<GameProvider>().amount;
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gameProvider = context.watch<GameProvider>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.h.verticalSpace,
              const CustomAppBar(title: "Create bet"),
              30.h.verticalSpace,

              Text(
                "Select opponent",
                style: AppTextStyles.sfProTextRegular(
                  fontSize: 16.sp,
                  color: AppColors.blackColor,
                ),
              ),
              10.h.verticalSpace,
              _buildOpponentSelector(gameProvider),

              20.h.verticalSpace,
              Text(
                "Bet amount",
                style: AppTextStyles.sfProTextRegular(
                  fontSize: 16.sp,
                  color: AppColors.blackColor,
                ),
              ),
              10.h.verticalSpace,
              CustomTextField(
                hintText: "₹ 0",
                controller: _amountController,
                keyboardType: TextInputType.number,
                onChanged: (val) => gameProvider.updateAmount(val),
              ),

              15.h.verticalSpace,
              _buildQuickAmounts(gameProvider),

              30.h.verticalSpace,
              _buildBetSummary(gameProvider),

              20.h.verticalSpace,
              CustomInfoBox(
                height: 102.h,
                text:
                    "Note: Both players must accept the bet before the game starts. Your bet amount will be held until the game is completed.",
                textStyle: AppTextStyles.textStyle12Regular.copyWith(
                  color: Color(0xFF433613),
                  fontSize: 12.sp,
                ),
              ),

              const Spacer(),
              Opacity(
                opacity: gameProvider.betAmount > 0 ? 1.0 : 0.3,
                child: AppButton(
                  text: "Create bet",
                  onTap: gameProvider.betAmount > 0
                      ? () => _showConfirmDialog(context, gameProvider)
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

  Widget _buildOpponentSelector(GameProvider gameProvider) {
    return AppCard(
      height: 60.h,
      borderRadius: BorderRadius.circular(12.r),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            gameProvider.selectedOpponent == "Earline R. Walk"
                ? "Computer"
                : gameProvider.selectedOpponent,
            style: AppTextStyles.sfProTextRegular(
              fontSize: 14.sp,
              color: AppColors.secondaryColor,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.secondaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAmounts(GameProvider gameProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: gameProvider.quickAmounts.map((amt) {
        return QuickAmountButton(
          amount: amt,
          onTap: () {
            _amountController.text = amt;
            gameProvider.updateAmount(amt);
          },
        );
      }).toList(),
    );
  }

  Widget _buildBetSummary(GameProvider gameProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bet summary",
          style: AppTextStyles.sfProTextMedium(
            fontSize: 18.sp,
            color: AppColors.blackColor,
          ),
        ),
        15.h.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(width: 1.w, color: const Color(0xFFE0E0E0)),
          ),
          padding: EdgeInsets.all(12.w),
          child: Column(
            children: [
              _buildSummaryRow("You vs", gameProvider.selectedOpponent),
              20.h.verticalSpace,
              _buildSummaryRow(
                "Bet amount",
                "₹${gameProvider.betAmount.toInt()}",
              ),
              20.h.verticalSpace,
              _buildSummaryRow(
                "Platform fee (5%)",
                "₹${gameProvider.platformFee.toInt()}",
              ),
              20.h.verticalSpace,
              Container(height: 1, color: const Color(0xFFE0E0E0)),
              20.h.verticalSpace,
              _buildSummaryRow(
                "Winner gets",
                "₹${gameProvider.potentialWinnings.toInt()}.00",
                valueColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value, {Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.sfProTextLight(
            fontSize: 12.sp,
            color: AppColors.greyColor,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.sfProTextMedium(
            fontSize: 14.sp,
            color: valueColor ?? AppColors.blackColor,
          ),
        ),
      ],
    );
  }

  void _showConfirmDialog(BuildContext context, GameProvider gameProvider) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ConfirmBetDialog(
        opponent: gameProvider.selectedOpponent,
        amount: gameProvider.betAmount,
        fee: gameProvider.platformFee,
        potentialWinnings: gameProvider.potentialWinnings,
      ),
    );
  }
}
