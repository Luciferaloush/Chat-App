import 'package:camera/camera.dart';
import 'package:chatappclone/utils/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraInitial());

  CameraCubit get(context) => BlocProvider.of(context);
  CameraController? cameraController;
  Future<void>? cameraVoid;

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

  Future<void> disposeCamera() async {
    await cameraController!.dispose();
  }
}
