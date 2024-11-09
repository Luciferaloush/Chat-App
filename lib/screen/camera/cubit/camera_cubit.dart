
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chatappclone/utils/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:video_player/video_player.dart';

import '../camera_view.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraInitial());

  static CameraCubit get(context) => BlocProvider.of(context);
  CameraController? cameraController;
  bool flash = false;
  Future<void>? cameraVoid;
  bool isRecording = false;
  VideoPlayerController? videoPlayerController;
  TextEditingController imageDescription = TextEditingController();

  Future<void> init() async {
    try {
      cameraController =
          CameraController(Constants.cameras![0], ResolutionPreset.high);
      await cameraController!.initialize();
      emit(OpenCamera());
    } catch (e) {
      emit(CameraError(err: e.toString()));
    }
  }
  void toggleFlash() {
    flash = !flash;
    if (flash) {
      cameraController!.setFlashMode(FlashMode.torch);
    } else {
      cameraController!.setFlashMode(FlashMode.off);
    }
    emit(FlashOn(isFlashOn: flash));

  }


  //  initVideo(String? path) async {
  //   try {
  //     videoPlayerController = VideoPlayerController.file(File(path))
  //       ..initialize().then((_) {
  //         emit(Init());
  //       });
  //   } catch (e) {
  //     emit(VideoError(err: e.toString()));
  //   }
  // }
  Future<void> disposeCamera() async {
    await cameraController!.dispose();
  }

  Future<void> takePhoto(BuildContext context, Function onImageSend, String sourceId, String targetId) async {
    try {
      XFile path = await cameraController!.takePicture();
      Navigator.pushNamed(context, CameraView.routeName, arguments: {
      "path": path.path,
        "onImageSend": onImageSend,
        "sourceChat": sourceId,
        "chats": targetId,
      }, );
    } catch (e) {
      emit(CameraError(err: e.toString()));
    }
  }
  Future<void> recordVideo(BuildContext context) async {
    try {
      // final directory = Directory.systemTemp;
      // videoPath = join(directory.path, "${DateTime.now()}.mp4");
      await cameraController!.startVideoRecording();
      isRecording = true;
      emit(VideoRecording());
    } catch (e) {
      emit(VideoError(err: e.toString()));
    }
  }
  Future<void> stopRecording(BuildContext context) async {
    if (!isRecording) return;
    try {
     XFile videoPath =  await cameraController!.stopVideoRecording();
      isRecording = false;
      emit(VideoRecordingStop());
      Navigator.pushNamed(context, "/video-screen", arguments: videoPath.path);

    } catch (e) {
      emit(VideoError(err: e.toString()));
    }
  }
}
