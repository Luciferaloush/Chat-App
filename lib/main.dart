import 'package:chatappclone/home_screen/home_screen.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: ColorApp.primaryColor,
        useMaterial3: true,
        fontFamily: "OpenSans"
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


