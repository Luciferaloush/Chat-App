import 'package:chatappclone/model/all_chat.dart';
import 'package:chatappclone/screen/chat_page/cubit/chat_page_cubit.dart';
import 'package:chatappclone/screen/login/cubit/login_cubit.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:chatappclone/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/auth/user.dart';
import '../../model/auth/users.dart';
import '../../model/chat_model.dart';

class ChatPage extends StatelessWidget {
  static const String routeName = "/chat-page";

  const ChatPage({super.key, required this.sourceChat,});

 // final List<Users> chats;
  final User sourceChat;

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
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ChatPageCubit()..initializeChat( sourceChat.id.toString()),
            ),
            BlocProvider(
              create: (context) => LoginCubit(),
            ),
          ],
          child: BlocConsumer<ChatPageCubit, ChatPageState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              ChatPageCubit cubit = ChatPageCubit.get(context);
              return ListView.builder(
                shrinkWrap: true,
                itemCount: cubit.allChat.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    receiver: cubit.allChat[index].receiverId!,
                    sourceChat: sourceChat,
                    messages: cubit.allChat[index],
                  );

                },);
            },
          ),
        )
    );
  }
}
