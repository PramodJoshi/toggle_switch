import 'package:flutter/material.dart';

class CustomBorderPaint extends CustomPainter {
  final double thickness;
  final Radius radius;
  final Gradient gradient;
  CustomBorderPaint({
    this.thickness = 8.0,
    this.radius = const Radius.circular(12),
    this.gradient = const LinearGradient(
        colors: [Colors.transparent, Colors.transparent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight),
  });
  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final Rect rectMaxSized =
        Rect.fromCenter(center: center, width: size.width, height: size.height);
    final Rect innerSpace = Rect.fromCenter(
        center: center,
        width: size.width - thickness * 2,
        height: size.height - thickness * 2);

    final Paint paint = Paint()..shader = gradient.createShader(rectMaxSized);

    canvas.drawDRRect(
        RRect.fromRectAndCorners(rectMaxSized,
            bottomLeft: radius,
            bottomRight: radius,
            topLeft: radius,
            topRight: radius),
        RRect.fromRectAndCorners(innerSpace,
            bottomLeft: radius,
            bottomRight: radius,
            topLeft: radius,
            topRight: radius),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
