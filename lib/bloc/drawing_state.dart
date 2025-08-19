part of 'drawing_bloc.dart';


class DrawingState {
  final BrushSettings brushSettings;
  final List<List<DrawingPoint>> strokes;
  final List<DrawingPoint> currentStroke;
  final bool isDrawing;

  const DrawingState({
    required this.brushSettings,
    required this.strokes,
    required this.currentStroke,
    required this.isDrawing,
  });

  DrawingState copyWith({
    BrushSettings? brushSettings,
    List<List<DrawingPoint>>? strokes,
    List<DrawingPoint>? currentStroke,
    bool? isDrawing,
  }) {
    return DrawingState(
      brushSettings: brushSettings ?? this.brushSettings,
      strokes: strokes ?? this.strokes,
      currentStroke: currentStroke ?? this.currentStroke,
      isDrawing: isDrawing ?? this.isDrawing,
    );
  }
}
