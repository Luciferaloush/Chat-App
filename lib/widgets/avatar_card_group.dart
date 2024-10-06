import 'package:chatappclone/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/chat_model.dart';
import '../utils/color.dart';

class AvatarCardGroup extends StatelessWidget {
  const AvatarCardGroup({super.key, required this.chat});
  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: Colors.grey,
                child: SvgPicture.asset(
                  "assets/svg_icon/person_36dp_000000.svg",
                  height: 30,
                  width: 30,
                  color: ColorApp.whiteColor,
                ),
              ),
              Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 11,
                        child: Icon(
                          Icons.clear,
                          color: ColorApp.whiteColor,
                          size: 13,
                        ),
                      ),
                    )
            ],
          ),
        const  SizedBox(height: 2,),
          Text(chat.name, style: AppStyle.subTitle,)
        ],
      ),
    );
  }
}
