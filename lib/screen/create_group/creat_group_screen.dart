import 'package:chatappclone/screen/create_group/cubit/create_group_cubit.dart';
import 'package:chatappclone/utils/AppStyle.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:chatappclone/widgets/contact_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupScreen extends StatelessWidget {
  const CreateGroupScreen({super.key});

  static const String routeName = "/create-group";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.primaryColor,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select contact",
                style: AppStyle.nameContact
                    .copyWith(fontSize: 16, color: ColorApp.whiteColor),
              ),
              Text(
                "125 contact",
                style: AppStyle.nameContact.copyWith(
                    fontSize: 12,
                    color: ColorApp.whiteColor,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 24,
                color: ColorApp.whiteColor,
              )),
          actions: [
            IconButton(onPressed: () {

            },
                icon: Icon(Icons.search_outlined, size: 26,
                  color: ColorApp.whiteColor,)),
            PopupMenuButton<String>(
              onSelected: (value) {
                if (kDebugMode) {
                  print(value);
                }
              },
              color: ColorApp.whiteColor,
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: "Invite a contact",
                    child: Text("Invite a contact"),
                  ),
                  const PopupMenuItem(
                    value: "Contacts",
                    child: Text("Contacts"),
                  ),
                  const PopupMenuItem(
                    value: "Refresh",
                    child: Text("Refresh"),
                  ),
                  const PopupMenuItem(
                    value: "help",
                    child: Text("help"),
                  ),
                ];
              },
            )

          ],
        ),
        body: BlocProvider(
          create: (context) => CreateGroupCubit(),
          child: BlocConsumer<CreateGroupCubit, CreateGroupState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              CreateGroupCubit cubit = CreateGroupCubit.get(context);
              return ListView.builder(
                itemCount: cubit.contacts.length,
                itemBuilder: (context, index) {
                  final contact =  cubit.contacts[index];
                  return InkWell(
                      onTap: () {
                       cubit.setStateSelect(index);
                      },
                      child: ContactCard(chat:contact ));
                },
              );
            },
          ),
        )

    );
  }
}
