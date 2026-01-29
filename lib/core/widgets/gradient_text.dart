import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient? gradient;
  final double? outlineWidth;
  final Color? outlineColor;
  final List<Shadow>? shadows;
  final TextAlign? textAlign;
  final double? letterSpacing;

  const CustomGradientText({
    super.key,
    required this.text,
    this.style,
    this.gradient,
    this.outlineWidth,
    this.outlineColor,
    this.shadows,
    this.textAlign,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = (style ?? AppTextStyles.textStyle32Bold).copyWith(
      letterSpacing: letterSpacing,
    );
    final effectiveGradient =
        gradient ??
        const LinearGradient(
          colors: [
            AppColors.greenTitleGradientStart,
            AppColors.greenTitleGradientEnd,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
    final effectiveOutlineWidth = outlineWidth ?? 2.5.w;
    final effectiveOutlineColor = outlineColor ?? AppColors.greenTitleOutline;
    final effectiveShadows =
        shadows ??
        [
          Shadow(
            color: AppColors.greenTitleOutline,
            offset: Offset(0, 1.h),
            blurRadius: 0,
          ),
          Shadow(
            color: AppColors.greenTitleOutline,
            offset: Offset(0.5.w, 0),
            blurRadius: 0,
          ),
        ];

    return Stack(
      children: [
        if (effectiveOutlineWidth > 0)
          Text(
            text,
            textAlign: textAlign,
            style: effectiveStyle.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = effectiveOutlineWidth
                ..color = effectiveOutlineColor,
              shadows: effectiveShadows,
            ),
          ),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => effectiveGradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
            text,
            textAlign: textAlign,
            style: effectiveStyle.copyWith(shadows: []),
          ),
        ),
      ],
    );
  }
}
