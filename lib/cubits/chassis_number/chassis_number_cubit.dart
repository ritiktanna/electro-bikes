import 'package:electro_bikes/cubits/chassis_number/chassis_number_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_strings.dart';

class ChassisNumberCubit extends Cubit<ChassisNumber> {
  ChassisNumberCubit() : super(InitialState());

  void changeInChassisNumber(String chassisNumber) {
    if (chassisNumber.isEmpty || chassisNumber.length == 0) {
      emit(EmptyChassisNumber());
    } else if (chassisNumber.length > 17) {
      emit(WrongChassisNumber(errorMessage: AppStrings.wrongChassisNumber));
    } else {
      emit(RightChassisNumber(isRight: true));
    }
  }
}
