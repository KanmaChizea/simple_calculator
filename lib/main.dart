import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_calculator/calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(),
      // darkTheme: ThemeData(
      //     brightness: Brightness.dark, scaffoldBackgroundColor: Colors.black),
      home: Calculator(),
    );
  }
}
