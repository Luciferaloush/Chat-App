import 'package:chatappclone/home_screen/cubit/home_screen_cubit.dart';
import 'package:chatappclone/screen/camera/camera_screen.dart';
import 'package:chatappclone/screen/camera/cubit/camera_cubit.dart';
import 'package:chatappclone/screen/chat_page/chat_page.dart';
import 'package:chatappclone/utils/AppStyle.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/chat_model.dart';
import '../screen/status/status_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';

  const HomeScreen({
    super.key,
    required this.chats,
    required this.sourceChat,
  });

  final List<Chat> chats;
  final Chat sourceChat;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late HomeScreenCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeScreenCubit(this);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: cubit,
        ),
        BlocProvider(
          create: (context) => CameraCubit(),
        ),
      ],
      child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorApp.primaryColor,
              title: Text(
                "Whats App",
                style: AppStyle.appBarStyle,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search_outlined, color: ColorApp.whiteColor),
                ),
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
                        value: "New Group",
                        child: Text("New Group"),
                      ),
                      const PopupMenuItem(
                        value: "New broadcast",
                        child: Text("New broadcast"),
                      ),
                      const PopupMenuItem(
                        value: "Whatsapp Web",
                        child: Text("Whatsapp Web"),
                      ),
                      const PopupMenuItem(
                        value: "Start message",
                        child: Text("Start message"),
                      ),
                      const PopupMenuItem(
                        value: "Settings",
                        child: Text("Settings"),
                      ),
                    ];
                  },
                )
              ],
              bottom: TabBar(
                controller: cubit.controller,
                labelColor: ColorApp.whiteColor,
                unselectedLabelColor: ColorApp.unSelectedTabColor,
                indicatorColor: ColorApp.whiteColor,
                tabs: [
                  Tab(
                      icon: Icon(
                    Icons.camera_alt,
                    color: ColorApp.whiteColor,
                  )),
                  const Tab(
                    text: "CHATS",
                  ),
                  const Tab(text: "STATUS"),
                  const Tab(text: "CALLS"),
                ],
              ),
            ),
            body: TabBarView(
              controller: cubit.controller,
              children: [
                const CameraScreen(),
                ChatPage(
                  chats: widget.chats,
                  sourceChat: widget.sourceChat,
                ),
                const StatusScreen(),
                const Center(child: Text('Calls')),
              ],
            ),
          );
        },
      ),
    );
  }
}
