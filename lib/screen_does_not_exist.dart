import 'package:chatappclone/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class ScreenDoesNotExist extends StatelessWidget {
  const ScreenDoesNotExist({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("No Screen"),
             ],
           ),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, '/');
          }, child: Text("Go Back"))

        ],
      ),
    );
  }
}
