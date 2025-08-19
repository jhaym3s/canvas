import 'package:drawcanvas/models/brush_settings.dart';
import 'package:flutter/material.dart';

class BrushPreview extends StatelessWidget {
  final BrushSettings brushSettings;

  const BrushPreview({
    Key? key,
    required this.brushSettings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Container(
          width: brushSettings.size,
          height: brushSettings.size,
          decoration: BoxDecoration(
            color: brushSettings.color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
