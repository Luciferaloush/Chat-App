import 'package:chatappclone/widgets/buttom_icon.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';

class BottomChet extends StatelessWidget {
  const BottomChet({super.key, this.onTap, this.onTap2, this.onTap3, this.onTap4, this.onTap5, this.onTap6});

  final void Function()? onTap;
  final void Function()? onTap2;
  final void Function()? onTap3;
  final void Function()? onTap4;
  final void Function()? onTap5;
  final void Function()? onTap6;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BottomIcon(
                      icon: Icons.insert_drive_file,
                      backgroundColor: Colors.indigo,
                      title: "Document",
                      onTap: onTap),
                  const SizedBox(
                    width: 40,
                  ),
                  BottomIcon(
                      icon: Icons.camera_alt,
                      backgroundColor: Colors.pink,
                      title: "Camera",
                      onTap: onTap2),
                  const SizedBox(
                    width: 40,
                  ),
                  BottomIcon(
                      icon: Icons.insert_photo,
                      backgroundColor: Colors.purple,
                      title: "Gallery",
                      onTap: onTap3),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BottomIcon(
                      icon: Icons.headset,
                      backgroundColor: Colors.orange,
                      title: "Audio",
                      onTap: onTap4),
                  const SizedBox(
                    width: 40,
                  ),
                  BottomIcon(
                      icon: Icons.location_on,
                      backgroundColor: ColorApp.accentColor,
                      title: "Location",
                      onTap: onTap5),
                  const SizedBox(
                    width: 40,
                  ),
                  BottomIcon(
                      icon: Icons.person,
                      backgroundColor: Colors.blue,
                      title: "Contact",
                      onTap: onTap6),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
