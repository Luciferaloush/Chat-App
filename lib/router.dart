import 'package:chatappclone/home_screen/home_screen.dart';
import 'package:chatappclone/model/all_chat.dart';
import 'package:chatappclone/model/auth/users.dart';
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
import 'package:chatappclone/screen/users/users.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'model/auth/user.dart';
import 'model/chat_model.dart';
import 'screen/create_group/creat_group_screen.dart';
import 'screen/otp/otp_screen.dart';
import 'screen_does_not_exist.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case IndividualPage.routeName:
      final args = routeSettings.arguments as Map<String, dynamic>?;
      final sourceChat = args?['sourceChat'] as User;
      final chats = args?['chats'] as Users;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => IndividualPage(
          sourceChat: sourceChat,
          chat: chats,
        ),
      );
    case HomeScreen.routeName:
      final args = routeSettings.arguments as Map<String, dynamic>?;
      final chats = args?['chats'] as List<Users>?;
      final sourceChat = args?['sourceChat'] as User?;
      final allChat = args?['allChat'] as AllChat?;

      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeScreen(
          //chats: chats!,
          sourceChat: sourceChat!,
        ),
      );
    case ChatPage.routeName:
      final args = routeSettings.arguments as Map<String, dynamic>?;
      final chats = args?['chats'] as List<Users>?;
      final sourceUser = args?['sourceChat'] as User?;
      final allChat = args?['allChat'] as AllChat?;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ChatPage(
          // chats: chats!,
          sourceChat: sourceUser!,
        ),
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
      final args = routeSettings.arguments as Map<String, dynamic>?;
      final onImageSend = args?['onImageSend'] as Function;
      //final onImageSend = routeSettings.arguments as Function;
      final chats = args?['chats'] as User;
      final sourceChat = args?['sourceChat'] as Users;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CameraScreen(
          onImageSend: onImageSend,
          sourceChat: sourceChat,
          chats: chats,
        ),
      );
    case CameraView.routeName:
      final args = routeSettings.arguments as Map<String, dynamic>?;
      final path = args?["path"] as String?;
      final onImageSend = args?["onImageSend"] as Function;
      final chats = args?['chats'] as int;
      final sourceChat = args?['sourceChat'] as int;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CameraView(
            imagePath: path,
            onImageSend: onImageSend,
            sourceChat: sourceChat,
            chat: chats),
      );
    case VideoView.routeName:
      final path = routeSettings.arguments as String?;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => VideoView(path: path),
      );
    case UsersPage.routeName:
      final user = routeSettings.arguments as User?;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => UsersPage(user: user!),
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
