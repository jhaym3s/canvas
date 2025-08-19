import 'package:drawcanvas/bloc/drawing_bloc.dart';
import 'package:drawcanvas/screens/drawing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawingApp extends StatelessWidget {
  const DrawingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawing Canvas App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => DrawingBloc(),
        child: const DrawingScreen(),
      ),
    );
  }
}

void main() {
  runApp(const DrawingApp());
}