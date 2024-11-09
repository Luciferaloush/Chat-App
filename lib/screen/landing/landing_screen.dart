import 'package:chatappclone/screen/landing/cubit/landing_cubit.dart';
import 'package:chatappclone/utils/AppStyle.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:chatappclone/utils/constant.dart';
import 'package:chatappclone/utils/image.dart';
import 'package:chatappclone/utils/text.dart';
import 'package:chatappclone/widgets/custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreen extends StatelessWidget {
  static const String routeName = "/landing-screen";

  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LandingCubit(),
      child: BlocConsumer<LandingCubit, LandingState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: SizedBox(
              height: context.screenSize.height,
              width: context.screenSize.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      AppText.welcomeLanding,
                      style: AppStyle.styleLanding,
                    ),
                    SizedBox(
                      height: context.screenSize.height / 8,
                    ),
                    Image.asset(AppImage.landingImage, height: 340, width: 340),
                    SizedBox(
                      height: context.screenSize.height / 7.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                            children: [
                              TextSpan(
                                text: AppText.desLanding,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              const TextSpan(
                                text: AppText.desLanding2,
                                style: TextStyle(color: Colors.cyan),
                              )
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomBottom(
                      onTap: () {},
                      width: context.screenSize.width - 110,
                      height: 50,
                      color: ColorApp.accentColor,
                      radius: 4,
                      title: "AGREE AND CONTINUE",
                      style: AppStyle.customBottom,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
