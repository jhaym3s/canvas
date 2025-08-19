part of 'drawing_bloc.dart';

@immutable
sealed class DrawingEvent {}

class BrushSizeChanged extends DrawingEvent {
  final double size;
  BrushSizeChanged(this.size);
}

class BrushColorChanged extends DrawingEvent {
  final Color color;
  BrushColorChanged(this.color);
}

class PointAdded extends DrawingEvent {
  final Offset point;
  PointAdded(this.point);
}

class StrokeStarted extends DrawingEvent {
  final Offset point;
  StrokeStarted(this.point);
}

class StrokeEnded extends DrawingEvent {}

class CanvasCleared extends DrawingEvent {}
