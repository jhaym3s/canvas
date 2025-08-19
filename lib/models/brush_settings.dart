import 'package:flutter/material.dart';

class BrushSettings {
  final double size;
  final Color color;

  const BrushSettings({
    required this.size,
    required this.color,
  });

  BrushSettings copyWith({
    double? size,
    Color? color,
  }) {
    return BrushSettings(
      size: size ?? this.size,
      color: color ?? this.color,
    );
  }
}