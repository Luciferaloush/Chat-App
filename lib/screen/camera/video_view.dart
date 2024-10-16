import 'dart:io';

import 'package:chatappclone/utils/AppStyle.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../utils/constant.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key, required this.path});

  final String? path;
  static const String routeName = "/video-screen";

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.path != null && widget.path!.isNotEmpty) {
      _controller = VideoPlayerController.file(File(widget.path!))
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

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
              child: _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    )
                  : Container(),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: context.screenSize.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                color: Colors.black38,
                child: TextFormField(
                  maxLines: 6,
                  minLines: 1,
                  style: AppStyle.hintTextCamera,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      helperText: "Add Caption....",
                      hintStyle: AppStyle.hintTextCamera,
                      prefixIcon: Icon(
                        Icons.add_photo_alternate,
                        color: ColorApp.whiteColor,
                        size: 27,
                      ),
                      suffixIcon: CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.teal[700],
                        child: Icon(Icons.check,
                            color: ColorApp.whiteColor, size: 27),
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _controller!.value.isPlaying
                        ? _controller!.pause()
                        : _controller!.play();
                  });
                },
                child: CircleAvatar(
                  radius: 33,
                  backgroundColor: Colors.black38,
                  child: Icon(
                    _controller!.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: ColorApp.whiteColor,
                    size: 50,
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
