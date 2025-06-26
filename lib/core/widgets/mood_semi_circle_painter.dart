// الكلاس الذي يرسم نصف الدائرة مع الأنيميشن
import 'dart:math' as math;

import 'package:flutter/material.dart';

class MoodSemiCirclePainter extends CustomPainter {
  final List<Color> colors;
  final List<double> values;
  final double thickness;
  final double progress; // 0.0 إلى 1.0

  MoodSemiCirclePainter({required this.colors, required this.values, required this.thickness, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;
    double startAngle = math.pi;
    final total = values.fold(0.0, (a, b) => a + b);
    double animatedSweep = math.pi * progress;
    double painted = 0;
    for (int i = 0; i < values.length; i++) {
      final sweep = (values[i] / total) * math.pi;
      final paint =
          Paint()
            ..color = colors[i]
            ..style = PaintingStyle.stroke
            ..strokeCap = StrokeCap.butt
            ..strokeWidth = thickness;
      // لا ترسم إلا ضمن حدود الأنيميشن
      if (painted + sweep > animatedSweep) {
        final left = animatedSweep - painted;
        if (left > 0) {
          canvas.drawArc(Rect.fromCircle(center: center, radius: radius - thickness / 2), startAngle, left, false, paint);
        }
        break;
      } else {
        canvas.drawArc(Rect.fromCircle(center: center, radius: radius - thickness / 2), startAngle, sweep, false, paint);
        startAngle += sweep;
        painted += sweep;
      }
    }
  }

  @override
  bool shouldRepaint(covariant MoodSemiCirclePainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.values != values || oldDelegate.colors != colors;
}
