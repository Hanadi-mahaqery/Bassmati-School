/*
import 'dart:math';

import 'package:flutter/material.dart';

class CircularPainter extends CustomPainter {
  final Color backgroundColor;
  final Color lineColor;
  final double width;

   final double sweepAngle;

  CircularPainter(this.sweepAngle,
      {required this.backgroundColor,
      required this.lineColor,
      required this.width});
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint backgraoundLine = Paint()
        ..color = backgroundColor
        ..strokeCap = StrokeCap.round
        ..style =PaintingStyle.stroke
        ..strokeWidth=width;

    Paint completeLine =Paint()
    ..color =lineColor
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = width;

    Offset can = Offset(size.width /2, size.height /2);

    double radius = min (size.width /2, size.height /2);
    double seetriangle = 2 * pi;
    canvas.drawCircle(can, radius, backgraoundLine);
    canvas.drawArc(Rect.fromCircle(center: can, radius: radius),
        -pi /2,
        sweepAngle,
        false,
        completeLine);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=> false;
}
*/
