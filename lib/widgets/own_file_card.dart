import 'dart:io';
import 'package:chatappclone/utils/constant.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter/material.dart';

class OwnFileCard extends StatelessWidget {
  const OwnFileCard({super.key, required this.path, required this.message, required this.time});

  final String path;
  final String message;
  final   String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Container(
          height: context.screenSize.height / 2.3,
          width: context.screenSize.width / 1.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green[300],
          ),
          child: Card(
            margin: EdgeInsets.all(3.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child:Column(
              children: [
                kIsWeb
                    ? Image.network(path,fit: BoxFit.fitHeight,) // Use Image.network for web
                    : Image.file(File(path,), fit: BoxFit.fitHeight,),
                Text(message),
              ],
            ), // Use Image.file for mobile
          ),
        ),
      ),
    );
  }
}
