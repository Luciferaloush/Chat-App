
import 'package:flutter/material.dart';

import '../utils/AppStyle.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.data, required this.color, this.style, required this.icon, this.fontSize, this.size});
  final IconData icon;
 final String data;
  final Color? color;
final TextStyle? style;
final double? fontSize;
final double? size;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color:color ?? Colors.teal, size: size?? 24),
        SizedBox(width: 25,),
        Text(data, style: style ?? AppStyle.teal.copyWith(
            fontSize: fontSize ?? 14.5
        ),)
      ],
    );
  }
}
