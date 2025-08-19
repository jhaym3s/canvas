import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerWidget extends StatelessWidget {
  final Color selectedColor;
  final ValueChanged<Color> onColorChanged;


  const ColorPickerWidget({
    super.key,
    required this.selectedColor,
    required this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text('Select', style: Theme.of(context).textTheme.labelMedium),
            Text('Color:', style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => _showColorPicker(context),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: selectedColor,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  void _showColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: selectedColor,
            onColorChanged: onColorChanged,
            labelTypes: const [ColorLabelType.rgb, ColorLabelType.hsv, ColorLabelType.hsl],
            pickerAreaHeightPercent: 0.7,
            colorPickerWidth: 200,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}
