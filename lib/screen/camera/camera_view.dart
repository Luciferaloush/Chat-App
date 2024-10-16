import 'dart:io';

import 'package:chatappclone/utils/AppStyle.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/constant.dart';
import 'cubit/camera_cubit.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key, required this.imagePath});

  final String? imagePath;
  static const String routeName = "/camera-screen";

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: ColorApp.whiteColor),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.crop_rotate,
                size: 27,
                color: ColorApp.whiteColor,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.emoji_emotions_outlined,
                  size: 27, color: ColorApp.whiteColor)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.title, size: 27, color: ColorApp.whiteColor)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit, size: 27, color: ColorApp.whiteColor))
        ],
      ),
      body: SizedBox(
        width: context.screenSize.width,
        height: context.screenSize.height,
        child: Stack(
          children: [
            SizedBox(
              width: context.screenSize.width,
              height: context.screenSize.height - 150,
              child: Image.file(
                File(widget.imagePath!),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: context.screenSize.width,
                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                color: Colors.black38,
                child: TextFormField(
                  maxLines: 6,
                  minLines: 1,
                  style: AppStyle.hintTextCamera,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      helperText: "Add Caption....",
                      hintStyle: AppStyle.hintTextCamera,
                      prefixIcon: Icon(Icons.add_photo_alternate, color: ColorApp.whiteColor, size: 27,),
                      suffixIcon: CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.teal[700],
                        child: Icon(Icons.check, color: ColorApp.whiteColor, size: 27),
                      )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}