import 'package:camera/camera.dart';
import 'package:chatappclone/home_screen/home_screen.dart';
import 'package:chatappclone/router.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:chatappclone/utils/constant.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
   Constants.cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: ColorApp.primaryColor,
          popupMenuTheme: const PopupMenuThemeData(
            color: Colors.white,
          ),
        useMaterial3: true,
        fontFamily: "OpenSans"
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: '/',
      home: const HomeScreen(),
    );
  }
}


