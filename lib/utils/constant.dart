 import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

 extension ContextExtensions on BuildContext {
   Size get screenSize => MediaQuery.of(this).size;
 }

class Constants {
  static  List<CameraDescription>? cameras;

  static   size(context){
    MediaQuery.of(BuildContext as BuildContext).size;
  }
  String baseUrl = "http://192.168.56.1:5000/api/";
  String user = "user";
  String register = "/register";
  String users = "/getAllUsers";
  String chat = "chat";
}