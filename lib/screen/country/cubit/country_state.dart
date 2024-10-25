part of 'country_cubit.dart';

@immutable
abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountrySelectedState extends CountryState {
 final Country selectedCountry;
  CountrySelectedState(this.selectedCountry);
}
