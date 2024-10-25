import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/country.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryInitial());

  static CountryCubit get(context) => BlocProvider.of(context);

  List<Country> countries = [
    Country(name: "india", code: "+91", flag: "🇮🇳"),
    Country(name: "Pakistan", code: "+92", flag: "🇵🇰"),
    Country(name: "United State", code: "+1", flag: "🇺🇸"),
    Country(name: "South Africa", code: "+27", flag: "🇿🇦"),
  ];
  Country selectedCountry = Country(name: "india", code: "+91", flag: "🇮🇳");

  void selectCountry(Country country) {
    selectedCountry = country;
    if (kDebugMode) {
      print(country);
    }
    emit(CountrySelectedState(selectedCountry));
  }
  Widget card(BuildContext context, Country country) {
    return InkWell(
      onTap: () {
        selectCountry(country);
        print(country.name);
        Navigator.pop(context, selectedCountry);
      },
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(0.15),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: SizedBox(
            width: 150,
            child: Row(
              children: [
                Text(country.flag),
                const SizedBox(
                  width: 15,
                ),
                Text(country.name),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(country.code),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
