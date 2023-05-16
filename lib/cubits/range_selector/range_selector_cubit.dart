import 'package:electro_bikes/cubits/range_selector/range_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RangeSelectorCubit extends Cubit<RangeState> {
  RangeSelectorCubit() : super(SecondRangeSelectedState());
  void changeRange(int index) {
    if (index == 1) {
      emit(FirstRangeSelectedState());
    } else if (index == 2) {
      emit(SecondRangeSelectedState());
    } else {
      emit(ThirdRangeSelectedState());
    }
  }
}
