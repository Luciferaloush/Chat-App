import 'package:chatappclone/utils/color.dart';
import 'package:chatappclone/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: ColorApp.primaryColor,
        onPressed: (){},
        child: Icon(Icons.chat_outlined, color: ColorApp.whiteColor),
      ),
      body: ListView(
        children: [
          CustomCard(),
          CustomCard()

        ],
      ),
    );
  }
}
