import 'package:chatappclone/home_screen/home_screen.dart';
import 'package:chatappclone/screen/auth/login.dart';
import 'package:chatappclone/screen/camera/camera_screen.dart';
import 'package:chatappclone/screen/camera/camera_view.dart';
import 'package:chatappclone/screen/camera/video_view.dart';
import 'package:chatappclone/screen/chat_page/chat_page.dart';
import 'package:chatappclone/screen/contact/contact_screen.dart';
import 'package:chatappclone/screen/country/country_screen.dart';
import 'package:chatappclone/screen/individual_screen/individual_page.dart';
import 'package:chatappclone/screen/landing/landing_screen.dart';
import 'package:chatappclone/screen/login/login_screen.dart';
import 'package:chatappclone/screen/status/status_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'model/chat_model.dart';
import 'screen/create_group/creat_group_screen.dart';
import 'screen/otp/otp_screen.dart';
import 'screen_does_not_exist.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case IndividualPage.routeName:
      final args = routeSettings.arguments as Map<String, dynamic>?;
      final chats = args?['chats'] as Chat?;
      final sourceChat = args?['sourceChat'] as Chat?;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => IndividualPage(chat: chats!, sourceChat: sourceChat!),
      );
    case HomeScreen.routeName:
      final args = routeSettings.arguments as Map<String, dynamic>?;
      final chats = args?['chats'] as List<Chat>?;
      final sourceChat = args?['sourceChat'] as Chat?;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeScreen(
          chats: chats!,
          sourceChat: sourceChat!,
        ),
      );
    case ChatPage.routeName:
      final args = routeSettings.arguments as Map<String, dynamic>?;
      final chats = args?['chats'] as List<Chat>?;
      final sourceChat = args?['sourceChat'] as Chat?;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ChatPage(chats: chats!, sourceChat: sourceChat!),
      );
    case OtpScreen.routeName:
      final args = routeSettings.arguments as Map<String, dynamic>?;
      final number = args?['number'] as String?;
      final countryCode = args?['countryCode'] as String?;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OtpScreen(number: number!, countryCode: countryCode!),
      );
    case ContactScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ContactScreen(),
      );
    case CreateGroupScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CreateGroupScreen(),
      );
    case CameraScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CameraScreen(),
      );
    case CameraView.routeName:
      final path = routeSettings.arguments as String?;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CameraView(imagePath: path),
      );
    case VideoView.routeName:
      final path = routeSettings.arguments as String?;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => VideoView(path: path),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case CountryScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CountryScreen(),
      );
    case StatusScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const StatusScreen(),
      );
    case LoginPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginPage(),
      );
    case LandingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LandingScreen(),
      );

    default:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ScreenDoesNotExist());
  }
}
