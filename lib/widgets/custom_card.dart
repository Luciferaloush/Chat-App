import 'package:chatappclone/model/reciver.dart';
import 'package:chatappclone/screen/individual_screen/individual_page.dart';
import 'package:chatappclone/utils/AppStyle.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/auth/user.dart';
import '../model/auth/users.dart';
import '../model/chat_model.dart';
import '../model/message.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.receiver, required this.sourceChat, required this.messages});

  final ReceiverId receiver;
  final User sourceChat;
  final Messages messages;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, IndividualPage.routeName, arguments: {
          "chats": receiver,
          "sourceChat": sourceChat,
        });
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: ColorApp.circleAvatar,
              child: SvgPicture.asset("", height: 37, width: 37),
            ),
            trailing: Text(messages.timestamp.toString()),
            title: Text(
              receiver.name.toString(),
              style: AppStyle.nameCustomCard,
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(
                  width: 3,
                ),
                Text(
                 messages.message.toString(),
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
