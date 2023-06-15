import 'package:demo_refresh_indicator/cupertino.dart';
import 'package:demo_refresh_indicator/refresh_indiactor.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(const MainApp());
  runApp(const CupertinoAppDemo());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: ResfreshDemo(),
        ),
      ),
    );
  }
}
