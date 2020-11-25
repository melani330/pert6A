import 'package:flutter/material.dart';
import 'package:menu/curved.dart';
import 'package:menu/navybar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavyBar(),
    );
  }
}
