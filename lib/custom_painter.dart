import 'package:drawcanvas/models/drawing_point.dart';
import 'package:flutter/material.dart';

class DrawingPainter extends CustomPainter {
  final List<List<DrawingPoint>> strokes;
  final List<DrawingPoint> currentStroke;

  DrawingPainter({
    required this.strokes,
    required this.currentStroke,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw completed strokes
    for (final stroke in strokes) {
      _drawStroke(canvas, stroke);
    }

    // Draw current stroke
    if (currentStroke.isNotEmpty) {
      _drawStroke(canvas, currentStroke);
    }
  }

  void _drawStroke(Canvas canvas, List<DrawingPoint> stroke) {
    if (stroke.length < 2) return;

    for (int i = 0; i < stroke.length - 1; i++) {
      canvas.drawLine(
        stroke[i].point,
        stroke[i + 1].point,
        stroke[i].paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}