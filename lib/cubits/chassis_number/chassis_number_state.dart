abstract class ChassisNumber {}

class InitialState extends ChassisNumber {}

class RightChassisNumber extends ChassisNumber {
  bool isRight;
  RightChassisNumber({this.isRight = false});
}

class EmptyChassisNumber extends ChassisNumber {}

class BiggerChassisNumber extends ChassisNumber {
  String? errorMessage;
  BiggerChassisNumber({this.errorMessage});
}

class WrongChassisNumber extends ChassisNumber {
  String? errorMessage;
  WrongChassisNumber({this.errorMessage});
}
