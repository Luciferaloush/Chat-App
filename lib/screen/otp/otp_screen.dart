import 'package:chatappclone/utils/AppStyle.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:chatappclone/utils/constant.dart';
import 'package:chatappclone/widgets/otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../widgets/bottomButton.dart';

class OtpScreen extends StatelessWidget {
  static const String routeName = "/otp-screen";

  const OtpScreen({super.key, required this.number, required this.countryCode});

  final String number;
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorApp.whiteColor,
        title: Text("Verify $countryCode $number", style: AppStyle.teal),
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(Icons.more_vert, color: Colors.black),
          )
        ],
      ),
      body: Container(
        width: context.screenSize.width,
        height: context.screenSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  const TextSpan(
                      text: "We have sent an SMS with a code to",
                      style: TextStyle(color: Colors.black, fontSize: 14.5)),
                  TextSpan(
                      text: "\t$countryCode $number\t",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.5,
                          fontWeight: FontWeight.bold)),
                ])),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Wrong number",style: TextStyle(
                    color: Colors.cyan[800],
                    fontSize: 14.5,
                    fontWeight: FontWeight.bold))
              ],
            ),
            const OtpField(),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Enter 6-digit code",style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    fontWeight: FontWeight.bold))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const BottomButton(
              icon: Icons.message,
              data: "Resend SMS",
              color: Colors.teal,
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 1.5,
            ),
            const SizedBox(
              height: 12,
            ),
            const BottomButton(
              icon: Icons.call,
              data: "Call me",
              color: Colors.teal,
            )
          ],
        ),
      ),
    );
  }
}
