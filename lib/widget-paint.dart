import 'package:flutter/material.dart';

class WidgetPainter extends CustomPainter {
  
  final List<Map<dynamic, dynamic>> points;

  WidgetPainter({
    this.points
  });

  @override
  void paint(canvas, size) {
    
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 6.0;

    Path path = Path();
    int idx = 0;
    this.points.forEach((point) {
      var vertice = Map.from(point);
      (idx==0) ? path.moveTo(vertice['x'], vertice['y']) : path.lineTo(vertice['x'], vertice['y']);
      idx++;
     });
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}