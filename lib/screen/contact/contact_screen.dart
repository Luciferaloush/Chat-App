import 'package:chatappclone/screen/contact/cubit/contact_cubit.dart';
import 'package:chatappclone/utils/AppStyle.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:chatappclone/widgets/button_card.dart';
import 'package:chatappclone/widgets/contact_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  static const String routeName = "/contact-screen";

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
          create: (context) => ContactCubit(),
          child: BlocConsumer<ContactCubit, ContactState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              ContactCubit cubit = ContactCubit.get(context);
              return ListView.builder(
                itemCount: cubit.contacts.length,
                itemBuilder: (context, index) {
                  final contact =  cubit.contacts[index];
                  if (index == 0) {
                    return ButtonCard(
                      onTap: (){
                        Navigator.pushNamed(context, "/create-group");
                      },
                      icon: Icons.group,
                      title: "New group",
                    );
                  }
                  else if (index == 1) {
                    return  ButtonCard(
                      onTap: () {

                      },
                      icon: Icons.person_add,
                      title: "Add contact",
                    );
                  }
                  return ContactCard(chat:contact );
                },
              );
            },
          ),
        )

    );
  }
}
