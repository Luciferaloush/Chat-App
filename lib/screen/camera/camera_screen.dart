import 'package:camera/camera.dart';
import 'package:chatappclone/utils/AppStyle.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:chatappclone/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/camera_cubit.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  static const routeName = '/camera_screen';

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraCubit cameraCubit;

  @override
  void initState() {
    super.initState();
    cameraCubit = context.read<CameraCubit>();
    cameraCubit.init();
  }

  @override
  void dispose() {
    cameraCubit.disposeCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraCubit, CameraState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        CameraCubit cubit = CameraCubit.get(context);
        if (state is OpenCamera) {
          return Stack(
            children: [
              SizedBox(
                  width: context.screenSize.width,
                  height: context.screenSize.height,
                  child: CameraPreview(cameraCubit.cameraController!)),
              Positioned(
                bottom: 0.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Container(
                    color: Colors.black,
                    width: context.screenSize.width,
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  cubit.toggleFlash();
                                },
                                icon: Icon(
                                  cubit.flash ? Icons.flash_on : Icons.flash_off,
                                  size: 26,
                                  color: ColorApp.whiteColor,
                                )),
                           GestureDetector(
                             onLongPress: () async{
                               await cubit.recordVideo(context);
                             },
                             onLongPressUp: () async{
                               await cubit.stopRecording(context);
                             },
                             onTap: () {
                               if(!cubit.isRecording) {
                                    cubit.takePhoto(context);
                                  }
                                },
                             child: cubit.isRecording ? Icon(
                               Icons.radio_button_on,
                               size: 70,
                               color: ColorApp.whiteColor,
                             ) : Icon(
                               Icons.panorama_fish_eye,
                               size: 70,
                                 color: ColorApp.whiteColor,
                             )
                           ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.flip_camera_android_outlined,
                                  size: 28,
                                  color: ColorApp.whiteColor,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Hold for video, tap for photo",
                          style: AppStyle.textCamera,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        } else if (state is CameraError) {
          return Center(child: Text('Error: ${state.err}'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

}
