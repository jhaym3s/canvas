import 'package:drawcanvas/bloc/drawing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../custom_painter.dart';

class DrawingCanvas extends StatelessWidget {
  const DrawingCanvas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawingBloc, DrawingState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: GestureDetector(
            onPanStart: (details) {
              context.read<DrawingBloc>().add(
                    StrokeStarted(details.localPosition),
                  );
            },
            onPanUpdate: (details) {
              context.read<DrawingBloc>().add(
                    PointAdded(details.localPosition),
                  );
            },
            onPanEnd: (details) {
              context.read<DrawingBloc>().add(StrokeEnded());
            },
            child: CustomPaint(
              painter: DrawingPainter(
                strokes: state.strokes,
                currentStroke: state.currentStroke,
              ),
              size: Size.infinite,
            ),
          ),
        );
      },
    );
  }
}
