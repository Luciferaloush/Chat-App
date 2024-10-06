import 'package:chatappclone/screen/individual_screen/individual_page.dart';
import 'package:chatappclone/utils/AppStyle.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/chat_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 53,
        width: 53,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.grey,
              child: SvgPicture.asset(
                chat.icon,
                height: 30,
                width: 30,
                color: ColorApp.whiteColor,
              ),
            ),
            chat.isSelect
                ? Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 11,
                      child: Icon(
                        Icons.check,
                        color: ColorApp.whiteColor,
                        size: 18,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
      title: Text(
        chat.name,
        style: AppStyle.nameCustomCard,
      ),
      subtitle: Text(
        chat.status,
        style: AppStyle.nameCustomCard
            .copyWith(fontSize: 13, fontWeight: FontWeight.normal),
      ),
    );
  }
}
