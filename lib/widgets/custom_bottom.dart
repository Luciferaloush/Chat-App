import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom(
      {super.key,
      this.onTap,
      required this.width,
      required this.height,
      required this.color,
      required this.radius,
      required this.title,
      required this.style});

  final void Function()? onTap;
  final double width;
  final double height;
  final Color color;
  final double radius;
  final String title;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Text(
            title,
            style: style,
          ),
        ),
      ),
    );
  }
}
