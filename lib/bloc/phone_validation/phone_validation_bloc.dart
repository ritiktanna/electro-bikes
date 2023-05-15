import 'package:electro_bikes/bloc/phone_validation/phone_validation_event.dart';
import 'package:electro_bikes/bloc/phone_validation/phone_validation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneValidationBloc extends Bloc<PhoneEvent, NumberState> {
  PhoneValidationBloc() : super(InitNumber()) {
    on<PhoneChangeEvent>((event, emit) {
      if (event.number == '') {
        emit(EmptyNumber('You Did Not Enter Any Number!'));
      } else if (event.number.length == 10) {
        emit(WrongNumber('Enter Number is Wrong'));
      } else {
        emit(RightNumber());
      }
    });
    on<PhoneNumberSubmitEvent>((event, emit) {
      emit(Loading());
    });
  }
}
