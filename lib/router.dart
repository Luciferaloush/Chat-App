import 'package:chatappclone/home_screen/home_screen.dart';
import 'package:chatappclone/screen/camera/camera_screen.dart';
import 'package:chatappclone/screen/camera/camera_view.dart';
import 'package:chatappclone/screen/camera/video_view.dart';
import 'package:chatappclone/screen/contact/contact_screen.dart';
import 'package:chatappclone/screen/individual_screen/individual_page.dart';
import 'package:flutter/material.dart';

import 'model/chat_model.dart';
import 'screen/create_group/creat_group_screen.dart';
import 'screen_does_not_exist.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case IndividualPage.routeName:
      final chat = routeSettings.arguments as Chat?;
      if (chat == null) {
        return MaterialPageRoute(
          builder: (_) => const ScreenDoesNotExist(),
        );
      }
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => IndividualPage(chat: chat),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
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

    default:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ScreenDoesNotExist());
  }
}
