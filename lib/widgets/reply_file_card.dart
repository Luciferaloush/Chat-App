import 'package:chatappclone/utils/constant.dart';
import 'package:flutter/material.dart';

class ReplyFileCard extends StatelessWidget {
  const ReplyFileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Container(
          height: context.screenSize.height / 2.3,
          width: context.screenSize.width / 1.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[400]
          ),
          child: Card(
            margin: EdgeInsets.all(3.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),

          ),
        ),
      ),
    );
  }
}
