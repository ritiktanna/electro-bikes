abstract class NumberState {}

class InitNumber extends NumberState {}

class RightNumber extends NumberState {}

class WrongNumber extends NumberState {
  String emptyErrorMessage;
  WrongNumber(this.emptyErrorMessage);
}

class EmptyNumber extends NumberState {
  String emptyErrorMessage;
  EmptyNumber(this.emptyErrorMessage);
}

class Loading extends NumberState {}
