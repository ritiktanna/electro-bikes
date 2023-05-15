abstract class CountryCodeState {}

class InitialState extends CountryCodeState {}

class CountryCodeChange extends CountryCodeState {
  String countryCode;
  CountryCodeChange({required this.countryCode});
}
