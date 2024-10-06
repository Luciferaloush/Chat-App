import 'package:chatappclone/screen/individual_screen/individual_page.dart';
import 'package:chatappclone/utils/AppStyle.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/chat_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, IndividualPage.routeName, arguments:chat);
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: ColorApp.circleAvatar,
              child: SvgPicture.asset(chat.icon, height: 37, width: 37),
            ),
            trailing: Text(chat.time),
            title: Text(
              chat.name,
              style: AppStyle.nameCustomCard,
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  chat.currentMessage,
                  style: AppStyle.nameCustomCard
                      .copyWith(fontSize: 13, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20.0, left: 80),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
