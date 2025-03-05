import 'package:calculatorproj/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration:
              BoxDecoration(color: const Color.fromARGB(255, 42, 43, 59)),
          child: AppController(),
        ),
      ),
    );
  }
}
