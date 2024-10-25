import 'package:chatappclone/screen/chat_page/cubit/chat_page_cubit.dart';
import 'package:chatappclone/screen/login/cubit/login_cubit.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:chatappclone/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/chat_model.dart';

class ChatPage extends StatelessWidget {
  static const String routeName = "/chat-page";

  const ChatPage({super.key, required this.chats, required this.sourceChat,});

  final List<Chat> chats;
  final Chat sourceChat;

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
              create: (context) => ChatPageCubit(),
            ),
            BlocProvider(
              create: (context) => LoginCubit(),
            ),
          ],
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              LoginCubit cubit = LoginCubit.get(context);
              return ListView.builder(
                shrinkWrap: true,
                itemCount: cubit.chats.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    chat: cubit.chats[index],
                    sourceChat: sourceChat,
                  );
                },);
            },
          ),
        )
    );
  }
}
