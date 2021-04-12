import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = HexColor('#482427');
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.38);
    path.quadraticBezierTo(
        size.width / 4, size.width / 10, size.width, size.height * 0.05);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
