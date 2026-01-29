import 'dart:math' as math;
import 'package:flutter/material.dart';

class ArchedText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double radius;
  final double? height;
  final double startAngle;
  final Color? outlineColor;
  final double outlineWidth;
  final List<Shadow>? shadows;
  final Gradient? gradient;
  final double? letterSpacing;

  const ArchedText({
    super.key,
    required this.text,
    required this.textStyle,
    this.radius = 200,
    this.height,
    this.startAngle = -math.pi / 2,
    this.outlineColor,
    this.outlineWidth = 1.0,
    this.shadows,
    this.gradient,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ArchedTextPainter(
        text: text,
        textStyle: textStyle,
        radius: radius,
        startAngle: startAngle,
        outlineColor: outlineColor,
        outlineWidth: outlineWidth,
        shadows: shadows,
        gradient: gradient,
        letterSpacing: letterSpacing,
      ),
      size: Size(radius * 2, height ?? radius),
    );
  }
}

class _ArchedTextPainter extends CustomPainter {
  final String text;
  final TextStyle textStyle;
  final double radius;
  final double startAngle;
  final Color? outlineColor;
  final double outlineWidth;
  final List<Shadow>? shadows;
  final Gradient? gradient;
  final double? letterSpacing;

  _ArchedTextPainter({
    required this.text,
    required this.textStyle,
    required this.radius,
    required this.startAngle,
    this.outlineColor,
    this.outlineWidth = 1.0,
    this.shadows,
    this.gradient,
    this.letterSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = radius;

    double currentAngle = startAngle;

    // Calculate total width to center the text along the arc
    double totalWidth = 0;
    List<TextPainter> painters = [];
    for (int i = 0; i < text.length; i++) {
      final tp = TextPainter(
        text: TextSpan(text: text[i], style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      painters.add(tp);
      totalWidth += tp.width;
      if (i < text.length - 1 && letterSpacing != null) {
        totalWidth += letterSpacing!;
      }
    }

    // Adjust start angle based on total width and radius
    final anglePerPixel = 1 / radius;
    currentAngle -= (totalWidth * anglePerPixel) / 2;

    for (int i = 0; i < text.length; i++) {
      final tp = painters[i];
      final charWidth = tp.width;
      final charAngle = charWidth * anglePerPixel;

      final angle = currentAngle + charAngle / 2;
      final x = centerX + radius * math.cos(angle);
      final y = centerY + radius * math.sin(angle);

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(angle + math.pi / 2);

      // 1. Draw Shadows
      if (shadows != null) {
        for (var shadow in shadows!) {
          final shadowPainter = TextPainter(
            text: TextSpan(
              text: text[i],
              style: textStyle.copyWith(
                color: shadow.color,
                shadows: [], // Don't nest shadows
              ),
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          shadowPainter.paint(
            canvas,
            Offset(
              -charWidth / 2 + shadow.offset.dx,
              -tp.height / 2 + shadow.offset.dy,
            ),
          );
        }
      }

      // 2. Draw Outline
      if (outlineColor != null) {
        final strokePainter = TextPainter(
          text: TextSpan(
            text: text[i],
            style: textStyle.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = outlineWidth
                ..color = outlineColor!,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        strokePainter.paint(canvas, Offset(-charWidth / 2, -tp.height / 2));
      }

      // 3. Draw Fill (with Gradient support)
      final fillPainter = TextPainter(
        text: TextSpan(
          text: text[i],
          style: textStyle.copyWith(
            color: gradient == null ? textStyle.color : Colors.white,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      if (gradient != null) {
        final rect = Rect.fromLTWH(
          -charWidth / 2,
          -tp.height / 2,
          charWidth,
          tp.height,
        );
        final paint = Paint()..shader = gradient!.createShader(rect);

        // Use a temporary canvas to apply the shader to the text
        canvas.saveLayer(rect, Paint());
        fillPainter.paint(canvas, Offset(-charWidth / 2, -tp.height / 2));
        canvas.drawRect(rect, paint..blendMode = BlendMode.srcIn);
        canvas.restore();
      } else {
        fillPainter.paint(canvas, Offset(-charWidth / 2, -tp.height / 2));
      }

      canvas.restore();
      currentAngle += charAngle;
      if (i < text.length - 1 && letterSpacing != null) {
        currentAngle += letterSpacing! * anglePerPixel;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
