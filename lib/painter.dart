import 'package:flutter/material.dart';
import 'dart:math' as Math;

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // final radius = Math.min(size.width, size.height) / 2;
    // final center = Offset(size.width / 2, size.height / 2);

    final myPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red.shade100
      ..strokeWidth = 10;

    // canvas.drawArc(Rect.fromCircle(center: center, radius: radius / 2), Math.pi,
    //     Math.pi, false, myPaint);

    double degToRad(double deg) => deg * (Math.pi / 180.0);

    final path = Path()
      ..arcTo(
          // 4.
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height,
            width: size.width,
          ), // 5.
          degToRad(180), // 6.
          degToRad(180), // 7.
          false);

    canvas.drawPath(path, myPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MyIndicator extends CustomPainter {
  MyIndicator(this.sweepAngle, this.color);
  final double? sweepAngle;
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 10.0 // 1.
      ..style = PaintingStyle.stroke // 2.
      ..color = color!; // 3.

    double degToRad(double deg) => deg * (Math.pi / 180.0);

    final path = Path()
      ..arcTo(
          // 4.
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height,
            width: size.width,
          ), // 5.
          degToRad(180), // 6.
          degToRad(sweepAngle!), // 7.
          false);

    canvas.drawPath(path, paint); // 8.
  }

  @override
  bool shouldRepaint(MyIndicator oldDelegate) =>
      sweepAngle != oldDelegate.sweepAngle;
}
