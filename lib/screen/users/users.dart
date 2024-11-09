import 'package:chatappclone/screen/individual_screen/individual_page.dart';
import 'package:chatappclone/screen/users/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/auth/user.dart';

class UsersPage extends StatelessWidget {
  static const routeName = '/users';
  const UsersPage({super.key, required this.user});
 final User user;
  @override
  Widget build(BuildContext context) {
    print(user.id);
    return BlocProvider(
      create: (context) => UsersCubit()..getUsers(),
      child: BlocConsumer<UsersCubit, UsersState>(
        listener: (context, state) {},
        builder: (context, state) {
          UsersCubit cubit = UsersCubit.get(context);
          return Scaffold(
            body: Stack(
              children: [
                ListView(
                  children: [
                    Column(
                      children: [
                        ListView.builder(
                          itemCount: cubit.users.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final users = cubit.users[index];
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, IndividualPage.routeName, arguments: {
                                'chats': users,
                                'sourceChat': user,
                                },);
                              },
                              child: ListTile(
                                title: Text(users.name.toString()),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
