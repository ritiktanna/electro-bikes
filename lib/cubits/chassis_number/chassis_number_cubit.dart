import 'package:electro_bikes/cubits/chassis_number/chassis_number_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_strings.dart';

class ChassisNumberCubit extends Cubit<ChassisNumber> {
  ChassisNumberCubit() : super(InitialState());

  void changeInChassisNumber(String chassisNumber) {
    if (chassisNumber.isEmpty || chassisNumber.length == 0) {
      emit(EmptyChassisNumber());
    } else if (chassisNumber.length > 17) {
      emit(BiggerChassisNumber(errorMessage: AppStrings.wrongChassisNumber));
    } else if (chassisNumber.length == 17) {
      emit(RightChassisNumber(isRight: true));
    }
  }
}
