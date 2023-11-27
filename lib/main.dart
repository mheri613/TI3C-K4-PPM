import 'package:flutter/material.dart';
import 'package:ti3c_k4_ppm/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(), 
      theme: ThemeData(primarySwatch: Colors.green),
      );
  }
}