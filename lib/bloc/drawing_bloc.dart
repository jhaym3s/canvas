import 'package:bloc/bloc.dart';
import 'package:drawcanvas/models/brush_settings.dart';
import 'package:drawcanvas/models/drawing_point.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'drawing_event.dart';
part 'drawing_state.dart';

class DrawingBloc extends Bloc<DrawingEvent, DrawingState> {
  DrawingBloc()
      : super(const DrawingState(
          brushSettings: BrushSettings(size: 5.0, color: Colors.black),
          strokes: [],
          currentStroke: [],
          isDrawing: false,
        )) {
    on<BrushSizeChanged>(_onBrushSizeChanged);
    on<BrushColorChanged>(_onBrushColorChanged);
    on<StrokeStarted>(_onStrokeStarted);
    on<PointAdded>(_onPointAdded);
    on<StrokeEnded>(_onStrokeEnded);
    on<CanvasCleared>(_onCanvasCleared);
  }

  void _onBrushSizeChanged(BrushSizeChanged event, Emitter<DrawingState> emit) {
    emit(state.copyWith(
      brushSettings: state.brushSettings.copyWith(size: event.size),
    ));
  }

  void _onBrushColorChanged(BrushColorChanged event, Emitter<DrawingState> emit) {
    emit(state.copyWith(
      brushSettings: state.brushSettings.copyWith(color: event.color),
    ));
  }

  void _onStrokeStarted(StrokeStarted event, Emitter<DrawingState> emit) {
    final paint = Paint()
      ..color = state.brushSettings.color
      ..strokeWidth = state.brushSettings.size
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final newPoint = DrawingPoint(point: event.point, paint: paint);
    
    emit(state.copyWith(
      currentStroke: [newPoint],
      isDrawing: true,
    ));
  }

  void _onPointAdded(PointAdded event, Emitter<DrawingState> emit) {
    if (state.isDrawing) {
      final paint = Paint()
        ..color = state.brushSettings.color
        ..strokeWidth = state.brushSettings.size
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;

      final newPoint = DrawingPoint(point: event.point, paint: paint);
      final updatedStroke = List<DrawingPoint>.from(state.currentStroke)
        ..add(newPoint);

      emit(state.copyWith(currentStroke: updatedStroke));
    }
  }

  void _onStrokeEnded(StrokeEnded event, Emitter<DrawingState> emit) {
    if (state.currentStroke.isNotEmpty) {
      final updatedStrokes = List<List<DrawingPoint>>.from(state.strokes)
        ..add(state.currentStroke);

      emit(state.copyWith(
        strokes: updatedStrokes,
        currentStroke: [],
        isDrawing: false,
      ));
    }
  }

  void _onCanvasCleared(CanvasCleared event, Emitter<DrawingState> emit) {
    emit(state.copyWith(
      strokes: [],
      currentStroke: [],
      isDrawing: false,
    ));
  }
}

