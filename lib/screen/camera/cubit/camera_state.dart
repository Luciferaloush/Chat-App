part of 'camera_cubit.dart';

@immutable
abstract class CameraState {}

class CameraInitial extends CameraState {}

class OpenCamera extends CameraState {}

class CameraError extends CameraState {
  final String err;

  CameraError({required this.err});
}
