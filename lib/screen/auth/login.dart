import 'package:chatappclone/helper/cache_helper.dart';
import 'package:chatappclone/home_screen/home_screen.dart';
import 'package:chatappclone/screen/auth/cubit/auth_cubit.dart';
import 'package:chatappclone/screen/country/cubit/country_cubit.dart';
import 'package:chatappclone/screen/login/login_screen.dart';
import 'package:chatappclone/screen/otp/otp_screen.dart';
import 'package:chatappclone/utils/AppStyle.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:chatappclone/utils/constant.dart';
import 'package:chatappclone/utils/text.dart';
import 'package:chatappclone/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/auth/user.dart';
import '../../model/country.dart';
import '../country/country_screen.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "/login-page";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorApp.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppText.loginPage,
          style: AppStyle.loginPage,
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    // TODO: implement listener
    if(state is RegisterSuccess){
      User user = state.user;
      print(user.id);
      Navigator.pushNamed(context, HomeScreen.routeName, arguments: {
        "sourceChat":user
      });
      print("SAVED: ${CacheHelper.getData(key: "token")}");
    }
    if(state is RegisterError){
      print("Register error");
    }
  },
  builder: (context, state) {
    AuthCubit authCubit = AuthCubit.get(context);
    return BlocConsumer<CountryCubit, CountryState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    CountryCubit cubit = CountryCubit.get(context);
    return SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          children: [
            const Text(
              "WhatsApp will send an sms message",
              style: TextStyle(fontSize: 13.5),
            ),
            Text(
              "What's my number?",
              style: TextStyle(fontSize: 12.5, color: Colors.cyan[800]),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(width: context.screenSize.width / 1.5 , controller: authCubit.name, hintText: "enter your name"),
            CustomTextField(width: context.screenSize.width / 1.5, controller: authCubit.email, hintText: "enter your email"),
            countryCard(context, cubit.selectedCountry),
            const SizedBox(
              height: 15,
            ),
            number(context, cubit.selectedCountry, authCubit.number),
            CustomTextField(width: context.screenSize.width / 1.5 , controller: authCubit.password, hintText: "enter your password"),

            Expanded(child: Container()),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, OtpScreen.routeName, arguments: {
                  "number": authCubit.number.text.trim(),
                  "countryCode":cubit.selectedCountry.code
                });
              },
              child: InkWell(
                onTap: () {
                  authCubit.register();
                },
                child: Container(
                  color: Colors.tealAccent[400],
                  height: 40,
                  width: 70,
                  child: const Center(
                    child: Text(
                      "NEXT",style: TextStyle(
                      fontWeight: FontWeight.w800
                    ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40,),

          ],
        )

    );
  });
  },
)
    );
  }

  Widget number(BuildContext context, Country country, TextEditingController controller) {
    return Container(
      width: context.screenSize.width / 1.5,
      height: 38,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.8,
                  color: Colors.teal
                )
              )
            ),
            child: Row(
              children: [
                const SizedBox(width: 10,),
                const Text("+",style: TextStyle(
                    fontSize: 18
                )),
                Text(country.code.substring(1), style: const TextStyle(
                  fontSize: 16
                ),),
                const SizedBox(width: 15,),

              ],
            ),
          ),
          const SizedBox(width: 30,),
          Container(
            width: context.screenSize.width / 1.5 - 100,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1.8,
                        color: Colors.teal
                    )
                )
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(12),
                hintText: "Phone number",


              ),
            ),
          )
        ],
      ),
    );


  }
  Widget countryCard(BuildContext context, Country country) {
    return InkWell(
      onTap: () async {
        final selectedCountry = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CountryScreen(),
          ),
        );
        if (selectedCountry != null) {
          context.read<CountryCubit>().selectCountry(selectedCountry);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.teal, width: 1.8)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "${country.name} ${country.flag}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_drop_down_outlined,
              color: Colors.teal,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }

}
