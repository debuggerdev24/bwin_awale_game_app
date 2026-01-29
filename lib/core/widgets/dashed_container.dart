import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashedContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double strokeWidth;
  final Color color;
  final Color borderColor;
  final Color shadowColor;
  final double borderRadius;
  final List<double> dashPattern;

  const DashedContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.strokeWidth = 2.0,
    this.color = Colors.white,
    this.borderColor = const Color(0xFFDAE4E2),
    this.shadowColor = const Color(0xFFB2C8C2),
    this.borderRadius = 10.0,
    this.dashPattern = const [6, 6],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius.r),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: Offset(0, 4.h),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: CustomPaint(
        painter: _DashedBorderPainter(
          strokeWidth: strokeWidth.w,
          color: borderColor,
          borderRadius: borderRadius.r,
          dashPattern: dashPattern,
        ),
        child: Padding(padding: padding ?? EdgeInsets.zero, child: child),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double borderRadius;
  final List<double> dashPattern;

  _DashedBorderPainter({
    required this.strokeWidth,
    required this.color,
    required this.borderRadius,
    required this.dashPattern,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            strokeWidth / 2,
            strokeWidth / 2,
            size.width - strokeWidth,
            size.height - strokeWidth,
          ),
          Radius.circular(borderRadius),
        ),
      );

    final Path dashedPath = _getDashedPath(path, dashPattern);
    canvas.drawPath(dashedPath, paint);
  }

  Path _getDashedPath(Path source, List<double> dashPattern) {
    final Path dest = Path();
    for (final PathMetric metric in source.computeMetrics()) {
      double distance = 0.0;
      bool draw = true;
      int i = 0;
      while (distance < metric.length) {
        final double len = dashPattern[i];
        if (draw) {
          dest.addPath(
            metric.extractPath(distance, distance + len),
            Offset.zero,
          );
        }
        distance += len;
        draw = !draw;
        i = (i + 1) % dashPattern.length;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(_DashedBorderPainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.borderRadius != borderRadius;
}
