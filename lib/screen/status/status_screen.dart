import 'package:chatappclone/utils/constant.dart';
import 'package:chatappclone/widgets/head_own_status.dart';
import 'package:chatappclone/widgets/other_status.dart';
import 'package:flutter/material.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  static const String routeName = "/status-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 48,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blueGrey[100],
              elevation: 8,
              child: Icon(Icons.edit, color: Colors.blueGrey[900]),
            ),
          ),
          SizedBox(
            height: 13,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.greenAccent[700],
              elevation: 8,
              child: const Icon(Icons.camera_alt),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeadOwnStatus(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                  child: Text("Recent updates",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const OtherStatus(
              name: "Ali Habib",
              time: "today at, 01:13",
              image: "assets/image/background.jpg",
                isSeen: false,
              statusNum: 2,
            ),
            const OtherStatus(
              name: "Ali Habib",
              time: "today at, 01:13",
              image: "assets/image/background.jpg",
              isSeen: false,
              statusNum: 5,
            ),
            const OtherStatus(
              name: "Ali Habib",
              time: "today at, 01:13",
              image: "assets/image/background.jpg",
              isSeen: false,
              statusNum: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                  child: Text("Viewed updates",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const OtherStatus(
              name: "Ali Habib",
              time: "today at, 01:13",
              image: "assets/image/background.jpg",
              isSeen: true,
              statusNum: 2,
            ),
            const OtherStatus(
              name: "Ali Habib",
              time: "today at, 01:13",
              image: "assets/image/background.jpg",
              isSeen: true,
              statusNum: 4,
            ),
            const OtherStatus(
              name: "Ali Habib",
              time: "today at, 01:13",
              image: "assets/image/background.jpg",
              isSeen: true,
              statusNum: 5,
            ),
          ],
        ),
      ),
    );
  }
}
