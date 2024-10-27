import 'package:camera/camera.dart';
import 'package:chatappclone/router.dart';
import 'package:chatappclone/screen/auth/cubit/auth_cubit.dart';
import 'package:chatappclone/screen/auth/login.dart';
import 'package:chatappclone/screen/country/cubit/country_cubit.dart';
import 'package:chatappclone/screen/landing/landing_screen.dart';
import 'package:chatappclone/screen/login/cubit/login_cubit.dart';
import 'package:chatappclone/screen/login/login_screen.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:chatappclone/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
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
      // home: MultiBlocProvider(
      //   providers: [
      //     BlocProvider(
      //       create: (context) => CountryCubit(),
      //     ),
      //     BlocProvider(
      //       create: (context) => AuthCubit(),
      //     ),
      //   ],
      //   child: const LoginPage(),
      // )
      home: LoginScreen()
    );
  }
}


