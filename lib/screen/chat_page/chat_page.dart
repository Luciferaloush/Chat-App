import 'package:chatappclone/screen/chat_page/cubit/chat_page_cubit.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:chatappclone/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {

  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorApp.primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, '/contact-screen');
          },
          child: Icon(Icons.chat_outlined, color: ColorApp.whiteColor),
        ),
        body: BlocProvider(
          create: (context) => ChatPageCubit(),
          child: BlocConsumer<ChatPageCubit, ChatPageState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              ChatPageCubit cubit = ChatPageCubit.get(context);
              return ListView.builder(
                shrinkWrap: true,
                itemCount:cubit.chats.length,
                itemBuilder: (context, index) {
                  return CustomCard(chat: cubit.chats[index]);
                },);
            },
          ),
        )
    );
  }
}
