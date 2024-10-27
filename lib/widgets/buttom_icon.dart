import 'package:flutter/material.dart';

import '../utils/color.dart';

class BottomIcon extends StatelessWidget {
  const BottomIcon(
      {super.key,
      this.onTap,
      this.backgroundColor,
      this.icon,
      required this.title});

  final void Function()? onTap;
  final Color? backgroundColor;
  final IconData? icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: backgroundColor,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  color: ColorApp.whiteColor,
                  size: 29,
                )),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(title)
        ],
      ),
    );
  }
}
