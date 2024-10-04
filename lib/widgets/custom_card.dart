import 'package:chatappclone/utils/AppStyle.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Column(
        children: [
          ListTile(
            leading:  CircleAvatar(
              radius: 30,
              child: SvgPicture.asset("assets/svg_icon/person_36dp_000000.svg",height: 37,width: 37),
              backgroundColor: ColorApp.circleAvatar,
            ),
            trailing: const Text("18:-04"),
            title: Text(
              "Ali Habib",
              style: AppStyle.nameCustomCard,
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  "hi Ali",
                  style: AppStyle.nameCustomCard
                      .copyWith(fontSize: 13, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left:80 ),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
