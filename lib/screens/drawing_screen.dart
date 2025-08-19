import 'package:drawcanvas/widgets/drawing_canvas.dart';
import 'package:flutter/material.dart';

import '../widgets/toolbar.dart';

class DrawingScreen extends StatelessWidget {
  const DrawingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawing Canvas Submission'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: const DrawingCanvas(),
            ),
          ),
          const DrawingToolbar(),
        ],
      ),
    );
  }
}