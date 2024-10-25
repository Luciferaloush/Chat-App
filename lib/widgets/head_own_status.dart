import 'package:chatappclone/utils/color.dart';
import 'package:flutter/material.dart';

class HeadOwnStatus extends StatelessWidget {
  const HeadOwnStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: ColorApp.whiteColor,
            backgroundImage: AssetImage("assets/image/background.jpg"),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: ColorApp.primaryColor,
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: ColorApp.whiteColor,
                ),
              ))
        ],
      ),
      title: Text("My Status" , style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black
      )),
      subtitle: Text("Tap to add status update", style: TextStyle(
        color: Colors.grey[900],
        fontSize: 13
      )),
    );
  }
}
