import 'package:flutter/material.dart';
import '../../Screen/dashboard.dart';
import '../../Screen/start_screen.dart';
import '../../Screen/home_screen.dart';
import '../../Theme/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: const StartScreen(),
    );
  }
}
