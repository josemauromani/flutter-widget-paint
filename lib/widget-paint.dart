import 'package:flutter/material.dart';

class WidgetPainter extends CustomPainter {
  
  final List<Map<dynamic, dynamic>> points;

  WidgetPainter({
    this.points
  });

  @override
  void paint(canvas, size) {
    
    Paint paint = Paint();
    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 8.0;

    Path path = Path();
    print(this.points);
    path.lineTo(80, 50);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}