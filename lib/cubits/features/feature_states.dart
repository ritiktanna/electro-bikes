abstract class FeatureState {}

class InitialState extends FeatureState {}

class FirstFeatureState extends FeatureState {
  bool isSelected;
  FirstFeatureState({this.isSelected = false});
}

class SecondFeatureState extends FeatureState {
  bool isSelected;
  SecondFeatureState({this.isSelected = false});
}

class ThirdFeatureState extends FeatureState {
  bool isSelected;
  ThirdFeatureState({this.isSelected = false});
}
