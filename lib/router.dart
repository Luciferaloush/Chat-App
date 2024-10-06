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

    default:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ScreenDoesNotExist());
  }
}
