import 'package:chatappclone/home_screen/home_screen.dart';
import 'package:chatappclone/screen/login/cubit/login_cubit.dart';
import 'package:chatappclone/screen/users/cubit/users_cubit.dart';
import 'package:chatappclone/widgets/button_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login-screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit()..getUsers(),
      child: BlocConsumer<UsersCubit, UsersState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          UsersCubit cubit = UsersCubit.get(context);
          return Scaffold(
            body:ListView.builder(
              itemCount: cubit.users.length,
              itemBuilder: (context, index) {
                final chats = cubit.users[index];
                return ButtonCard(
                    onTap: () {
                      cubit.userss = cubit.users.removeAt(index);
                      Navigator.pushReplacementNamed(context, HomeScreen.routeName, arguments: {
                        'chats': cubit.users,
                        'sourceChat': cubit.userss,
                      });
                    },
                    icon: Icons.person,
                    title: chats.name.toString()
                );
              },
            ) ,
          );
        },
      ),
    );
  }
}
