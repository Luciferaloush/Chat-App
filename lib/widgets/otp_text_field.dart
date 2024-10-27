import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpField extends StatelessWidget {
  const OtpField({super.key, this.borderWidth});
  final double? borderWidth;
  @override
  Widget build(BuildContext context) {
    return  OtpTextField(
      numberOfFields: 6,
      borderColor: const Color(0xFF121212),
      focusedBorderColor: const Color(0xFF6A53A1),
      styles: const [],
      showFieldAsBox: false,
      borderWidth:borderWidth ?? 4.0,
      onCodeChanged: (String code) {},
      onSubmit: (String verificationCode) {},
    );
  }
}
