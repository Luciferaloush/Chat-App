import 'package:chatappclone/home_screen/home_screen.dart';
import 'package:chatappclone/screen/login/cubit/login_cubit.dart';
import 'package:chatappclone/widgets/button_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login-screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            body:ListView.builder(
              itemCount: cubit.chats.length,
              itemBuilder: (context, index) {
                final chats = cubit.chats[index];
                return ButtonCard(
                    onTap: () {
                      cubit.sourceChat = cubit.chats.removeAt(index);
                      Navigator.pushReplacementNamed(context, HomeScreen.routeName, arguments: {
                        'chats': cubit.chats,
                        'sourceChat': cubit.sourceChat,
                      });
                    },
                    icon: Icons.person,
                    title: chats.name);
              },
            ) ,
          );
        },
      ),
    );
  }
}
