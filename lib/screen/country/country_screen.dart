import 'package:chatappclone/screen/country/cubit/country_cubit.dart';
import 'package:chatappclone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/AppStyle.dart';
import '../../utils/text.dart';

class CountryScreen extends StatelessWidget {
  static const String routeName = "/country-screen";

  const CountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryCubit(),
      child: BlocConsumer<CountryCubit, CountryState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          CountryCubit cubit = CountryCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorApp.whiteColor,
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.teal,
                  )),
              title: Text(
                " Choose Country",
                style: AppStyle.loginPage,
              ),
              centerTitle: true,
              elevation: 0,
              actions: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.search_outlined,
                      color: Colors.teal,
                    )),
              ],
            ),
            body: ListView.builder(
              itemCount: cubit.countries.length,
              itemBuilder: (context, index) {
                return cubit.card(context, cubit.countries[index]);
              },
            ),
          );
        },
      ),
    );
  }
}