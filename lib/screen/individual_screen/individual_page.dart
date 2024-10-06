import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/chat_model.dart';
import '../../utils/AppStyle.dart';
import '../../utils/color.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key, required this.chat});
  static const routeName = '/individual';

  final Chat chat;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    bool show = false;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
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
                  widget.chat.name,
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
                widget.chat.isGroup
                    ? "assets/svg_icon/groups_36dp_5F6368.svg"
                    : "assets/svg_icon/person_36dp_000000.svg",
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(
              children: [],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                              helperText: "Type a message",
                              contentPadding: const EdgeInsets.all(5.0),
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.emoji_emotions),
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
                                        backgroundColor: Colors.transparent,
                                        context: context, builder: (context) {
                                        return bottomChet();
                                      },);
                                    },
                                    icon: Icon(Icons.attach_file, color: ColorApp.accentColor,),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.camera_alt,color: ColorApp.accentColor),
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
                            onPressed: () {},
                            icon: Icon(Icons.mic, color: ColorApp.whiteColor),
                          ),
                        ),
                      )
                    ],
                  ),

                  show ? emojiSelect() : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget bottomChet(){
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 icon(Icons.insert_drive_file, Colors.indigo, "Document"),
                  const SizedBox(width: 40,),
                  icon(Icons.camera_alt, Colors.pink, "Camera"),
                  const SizedBox(width: 40,),
                  icon(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon(Icons.headset, Colors.orange, "Audio"),
                  const SizedBox(width: 40,),
                  icon(Icons.location_on, ColorApp.accentColor, "Location"),
                  const SizedBox(width: 40,),
                  icon(Icons.person, Colors.blue, "Contact"),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
Widget icon(IconData? icon,Color? color, String? title){
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child:IconButton(onPressed: (){}, icon: Icon(icon, color: ColorApp.whiteColor,size: 29,)),

        ),
        const SizedBox(height: 5,),
        Text(title!)
      ],
    );
}
  Widget emojiSelect (){
    return EmojiPicker(
      config: const Config(
        height: 250,
        emojiSet: defaultEmojiSet,
        emojiTextStyle: TextStyle(fontSize: 20),
        categoryViewConfig: CategoryViewConfig(

        ),
      ),
      onEmojiSelected:(emoji, category){
        if (kDebugMode) {
          print(emoji);
        }


      } ,
    );
  }
}
