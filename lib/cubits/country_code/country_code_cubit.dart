import 'package:electro_bikes/cubits/country_code/countrycode_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryCodeCubit extends Cubit<CountryCodeState> {
  CountryCodeCubit() : super(InitialState());
  String countryCode = '+91';

  void changeCountryCode(String changedCountryCode) {
    countryCode = changedCountryCode;
    emit(CountryCodeChange(countryCode: countryCode));
  }
}
