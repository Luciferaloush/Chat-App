import 'package:chatappclone/utils/AppStyle.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key,required this.onTap, required this.icon, required this.title});
 final  void Function()? onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: ColorApp.accentColor,
            radius: 23,
            child: Icon(icon, color: ColorApp.whiteColor,),
          ),
          title: Text(title,style: AppStyle.nameContact),
        ),
      ),
    );
  }
}
