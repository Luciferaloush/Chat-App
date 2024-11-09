part of 'camera_cubit.dart';

@immutable
abstract class CameraState {}

class CameraInitial extends CameraState {}

class OpenCamera extends CameraState {}
class Init extends CameraState {}
class CameraError extends CameraState {
  final String err;

  CameraError({required this.err});
}
class FlashOn extends CameraState {
  final bool isFlashOn;
  FlashOn({required this.isFlashOn});
}
class VideoRecording extends CameraState {}

class VideoRecordingStop extends CameraState {}

class VideoError extends CameraState {
  final String err;

  VideoError({required this.err});
}
class SetPopTime extends CameraState {}
