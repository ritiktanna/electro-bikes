import 'package:electro_bikes/cubits/features/feature_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureCubit extends Cubit<FeatureState> {
  FeatureCubit() : super(InitialState());

  void changeInFeature({required int index, required bool isSelected}) {
    if (index == 1) {
      emit(FirstFeatureState(isSelected: !isSelected));
    } else if (index == 2) {
      emit(SecondFeatureState(isSelected: !isSelected));
    } else {
      emit(ThirdFeatureState(isSelected: !isSelected));
    }
  }
}
