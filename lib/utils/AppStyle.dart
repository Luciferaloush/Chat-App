
import 'package:chatappclone/utils/color.dart';
import 'package:flutter/material.dart';

class AppStyle{
  static TextStyle appBarStyle = TextStyle(
    fontSize: 18,
    color: ColorApp.whiteColor,
    fontWeight: FontWeight.bold
  );
  static TextStyle hintTextCamera = TextStyle(
      fontSize: 17,
      color: ColorApp.whiteColor,
  );
  static TextStyle nameCustomCard = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold
  );
  static TextStyle nameContact = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold
  );
  static TextStyle subTitle = const TextStyle(
      fontSize: 12,
    color: Colors.grey
  );
  static TextStyle textCamera =  TextStyle(
      color: ColorApp.whiteColor,
  );
  static TextStyle chat =  TextStyle(
    fontSize: 17
  );
  static TextStyle doneMessage =  TextStyle(
      fontSize: 13,
    color: Colors.grey[600]
  );
}