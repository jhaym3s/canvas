import 'package:drawcanvas/bloc/drawing_bloc.dart';
import 'package:drawcanvas/widgets/brush_preview.dart';
import 'package:drawcanvas/widgets/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawingToolbar extends StatelessWidget {
  const DrawingToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return BlocBuilder<DrawingBloc, DrawingState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(isTablet ? 20 : 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: isTablet ? _buildTabletLayout(context, state) : _buildMobileLayout(context, state),
        );
      },
    );
  }

  Widget _buildTabletLayout(BuildContext context, DrawingState state) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text('Preview:', style: Theme.of(context).textTheme.labelMedium),
            BrushPreview(brushSettings: state.brushSettings),
          ],
        ),
        const SizedBox(width: 24),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Brush Size: ${state.brushSettings.size.toInt()}px'),
              Slider(
                value: state.brushSettings.size,
                min: 1.0,
                max: 50.0,
                activeColor: state.brushSettings.color,
                divisions: 49,
                onChanged: (value) {
                  context.read<DrawingBloc>().add(BrushSizeChanged(value));
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 24),
        ColorPickerWidget(
          selectedColor: state.brushSettings.color,
          onColorChanged: (color) {
            context.read<DrawingBloc>().add(BrushColorChanged(color));
          },
        ),
        const SizedBox(width: 24),
        ElevatedButton.icon(
          onPressed: () {
            context.read<DrawingBloc>().add(CanvasCleared());
          },
          icon: const Icon(Icons.clear),
          label: const Text('Clear'),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, DrawingState state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text('Preview:', style: Theme.of(context).textTheme.labelMedium),
              BrushPreview(brushSettings: state.brushSettings),
            ],
          ),
            const SizedBox(width: 16),
            Expanded(
              child: ColorPickerWidget(
                selectedColor: state.brushSettings.color,
                onColorChanged: (color) {
                  context.read<DrawingBloc>().add(BrushColorChanged(color));
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<DrawingBloc>().add(CanvasCleared());
              },
              child: const Text('Clear'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        
        // Second Row: Brush Size Slider
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Brush Size: ${state.brushSettings.size.toInt()}px'),
            Slider(
              value: state.brushSettings.size,
              min: 1.0,
              max: 50.0,
              divisions: 49,
              onChanged: (value) {
                context.read<DrawingBloc>().add(BrushSizeChanged(value));
              },
            ),
          ],
        ),
      ],
    );
  }
}
