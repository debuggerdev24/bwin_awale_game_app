import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularGradientButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final double? size;
  final Color? color;
  final Gradient? gradient;
  final List<BoxShadow>? shadows;
  final BoxBorder? border;

  const CircularGradientButton({
    super.key,
    required this.child,
    required this.onTap,
    this.size,
    this.color,
    this.gradient,
    this.shadows,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveSize = size ?? 60.w;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: effectiveSize,
        height: effectiveSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          gradient: color != null
              ? null
              : (gradient ??
                    const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF7BCB3F), Color(0xFF168326)],
                    )),
          border:
              border ?? Border.all(color: const Color(0xFF064E3B), width: 1.w),
          boxShadow:
              shadows ??
              [
                BoxShadow(
                  color: const Color(0xFF064E3B),
                  offset: Offset(0, 3.h),
                  blurRadius: 0,
                  spreadRadius: 0,
                ),
              ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
