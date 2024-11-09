import 'package:camera/camera.dart';
import 'package:chatappclone/screen/camera/camera_screen.dart';
import 'package:chatappclone/screen/camera/camera_view.dart';
import 'package:chatappclone/screen/individual_screen/cubit/individual_cubit.dart';
import 'package:chatappclone/utils/constant.dart';
import 'package:chatappclone/widgets/own_file_card.dart';
import 'package:chatappclone/widgets/own_message_card.dart';
import 'package:chatappclone/widgets/reply_file_card.dart';
import 'package:chatappclone/widgets/reply_message_card.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/auth/user.dart';
import '../../model/auth/users.dart';
import '../../model/chat_model.dart';
import '../../utils/AppStyle.dart';
import '../../utils/color.dart';
import '../../widgets/bottom_chet.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({
    super.key,
    required this.chat,
    required this.sourceChat,
  });

  static const routeName = '/individual';
  final Users chat;
  final User sourceChat;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.sourceChat.id);
    bool show = false;
    return BlocProvider(
      create: (context) {
        IndividualCubit cubit = IndividualCubit()
          ..getChat(
              userId: widget.sourceChat.id.toString(),
              targetId: widget.chat.sId.toString());
        cubit.connect(widget.sourceChat.id.toString(), widget.chat.sId.toString());
        return cubit;
      },
      child: BlocConsumer<IndividualCubit, IndividualState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          IndividualCubit cubit = IndividualCubit.get(context);
          return Stack(
            children: [
              Image.asset(
                "assets/image/background.jpg",
                height: context.screenSize.height,
                width: context.screenSize.width,
                fit: BoxFit.cover,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: AppBar(
                    leadingWidth: 70,
                    backgroundColor: ColorApp.primaryColor,
                    title: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.chat.name.toString(),
                              style: AppStyle.appBarStyle,
                            ),
                            Text(
                              "Last seen today at 7:08",
                              style: AppStyle.nameCustomCard.copyWith(
                                fontSize: 13,
                                color: ColorApp.subtitle,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    leading: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 24,
                            color: ColorApp.whiteColor,
                          ),
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: ColorApp.circleAvatar,
                          child: SvgPicture.asset(
                            // widget.chat.isGroup
                            //     ? "assets/svg_icon/groups_36dp_5F6368.svg"
                            //     :
                            "assets/svg_icon/person_36dp_000000.svg",
                            color: ColorApp.whiteColor,
                            height: 37,
                            width: 37,
                          ),
                        )
                      ],
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.videocam, color: ColorApp.whiteColor),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.call, color: ColorApp.whiteColor),
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
                              value: "View contact",
                              child: Text("View contact"),
                            ),
                            const PopupMenuItem(
                              value: "Media, links, and doc",
                              child: Text("Media, links, and doc"),
                            ),
                            const PopupMenuItem(
                              value: "Whatsapp Web",
                              child: Text("Whatsapp Web"),
                            ),
                            const PopupMenuItem(
                              value: "Search",
                              child: Text("Search"),
                            ),
                            const PopupMenuItem(
                              value: "Mute Notification",
                              child: Text("Mute Notification"),
                            ),
                            const PopupMenuItem(
                              value: "Wallpaper",
                              child: Text("Wallpaper"),
                            ),
                          ];
                        },
                      )
                    ],
                  ),
                ),
                body: SizedBox(
                  height: context.screenSize.height,
                  width: context.screenSize.width,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: cubit.scrollController,
                          itemCount: cubit.allChat.length + 1,
                          itemBuilder: (context, index) {
                            if (index == cubit.allChat.length) {
                              return const SizedBox(height: 70); // Space at the bottom
                            }
                            final message = cubit.allChat[index];
                            bool isSender = message.isSender ?? false;

                            if (isSender) {
                              if (message.path!.isNotEmpty) {
                                return OwnFileCard(
                                  path: message.path.toString(),
                                  message: message.message.toString(),
                                  time: message.timestamp.toString(),
                                );
                              } else {
                                return OwnMessageCard(
                                  message: message.message.toString(),
                                  time: message.timestamp.toString(),
                                );
                              }
                            } else {
                              if (message.path!.isNotEmpty) {
                                return ReplyFileCard(
                                  path: message.path.toString(),
                                  message: message.message.toString(),
                                  time: message.timestamp.toString(),
                                );
                              }
                              return ReplayMessageCard(
                                message: message.message.toString(),
                                time: message.timestamp.toString(),
                              );
                            }
                          },
                        ),
                      ),                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: context.screenSize.width - 60,
                                    child: Card(
                                      margin: const EdgeInsets.only(
                                          left: 2, right: 2, bottom: 8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: TextFormField(
                                        controller: cubit.messageController,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 5,
                                        minLines: 1,
                                        onChanged: (value) {
                                          cubit.sendButtonMessage(value);
                                        },
                                        decoration: InputDecoration(
                                          helperText: "Type a message",
                                          contentPadding:
                                              const EdgeInsets.all(5.0),
                                          prefixIcon: IconButton(
                                            icon: const Icon(
                                                Icons.emoji_emotions),
                                            onPressed: () {
                                              setState(() {
                                                show = !show;
                                              });
                                            },
                                          ),
                                          suffixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return BottomChet(
                                                        onTap: () {},
                                                        onTap2: () {
                                                          cubit.setPopTime(3);
                                                          Navigator.pushNamed(
                                                              context,
                                                              CameraScreen
                                                                  .routeName,
                                                              arguments: {
                                                                // "onImageSend":widget.onImageSend,
                                                                "sourceChat": widget
                                                                    .sourceChat
                                                                    .id
                                                                    .toString(),
                                                                "chats": widget
                                                                    .chat.sId
                                                                    .toString()
                                                              });
                                                        },
                                                        onTap3: () async {
                                                          cubit.setPopTime(2);
                                                          cubit.file = await cubit
                                                              .picker
                                                              .pickImage(
                                                                  source: ImageSource
                                                                      .gallery);
                                                          Navigator.pushNamed(
                                                              context,
                                                              CameraView
                                                                  .routeName,
                                                              arguments: cubit
                                                                  .file!.path);
                                                        },
                                                        onTap4: () {},
                                                        onTap5: () {},
                                                        onTap6: () {},
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.attach_file,
                                                  color: ColorApp.accentColor,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  cubit.setPopTime(2);
                                                  Navigator.pushNamed(context,
                                                      CameraScreen.routeName,
                                                      arguments: {
                                                        "onImageSend":
                                                            cubit.onImageSend,
                                                        "sourceChat":
                                                            widget.sourceChat,
                                                        "chats": widget.chat
                                                      });
                                                },
                                                icon: Icon(Icons.camera_alt,
                                                    color:
                                                        ColorApp.accentColor),
                                              ),
                                            ],
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 8.0,
                                      right: 5.0,
                                      left: 2.0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 32,
                                      backgroundColor: ColorApp.accentColor,
                                      child: IconButton(
                                        onPressed: () {
                                          cubit.scrollController.animateTo(
                                            cubit.scrollController.position
                                                .maxScrollExtent,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeOut,
                                          );
                                          if (cubit.sendButton) {
                                            cubit.sendMessage(
                                                cubit.messageController.text,
                                                widget.sourceChat.id.toString(),
                                                widget.chat.sId.toString(),
                                                cubit.file?.path ?? '');
                                            cubit.messageController.clear();
                                            setState(() {
                                              cubit.sendButton = false;
                                            });
                                          }
                                        },
                                        icon: Icon(
                                            cubit.sendButton
                                                ? Icons.send
                                                : Icons.mic,
                                            color: ColorApp.whiteColor),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              if (show) emojiSelect(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      config: const Config(
        height: 250,
        emojiSet: defaultEmojiSet,
        emojiTextStyle: TextStyle(fontSize: 20),
        categoryViewConfig: CategoryViewConfig(),
      ),
      onEmojiSelected: (emoji, category) {
        if (kDebugMode) {
          print(emoji);
        }
      },
    );
  }
}
