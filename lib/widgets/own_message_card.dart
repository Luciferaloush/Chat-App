import 'package:chatappclone/utils/AppStyle.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:chatappclone/utils/constant.dart';
import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({super.key, required this.message, required this.time});
  final String message;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(constraints: BoxConstraints(
        maxWidth: context.screenSize.width - 45,
      ),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: ColorApp.cardChat,
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 60.0, top: 5.0, bottom: 20.0),
              child: Text(message,style: AppStyle.chat),
            ),
            Positioned(
              bottom: 4,
              right: 10,
              child: Row(
                children: [
                  Text(time,style: AppStyle.chat),
                  SizedBox(width: 5,),
                  Icon(Icons.done_all, size: 20,)
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
