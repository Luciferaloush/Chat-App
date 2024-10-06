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
    return BlocBuilder<CameraCubit, CameraState>(
      builder: (context, state) {
        if (state is OpenCamera) {
          return Stack(
            children: [
              CameraPreview(cameraCubit.cameraController!),
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
                                onPressed: () {},
                                icon: Icon(
                                  Icons.flash_off,
                                  size: 26,
                                  color: ColorApp.whiteColor,
                                )),
                           InkWell(
                             onTap: () {

                             },
                             child: Icon(
                               Icons.panorama_fish_eye,
                               size: 70,
                                 color: ColorApp.whiteColor,
                             ),
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
