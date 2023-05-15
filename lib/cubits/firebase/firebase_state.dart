abstract class FireBaseState {}

class InitialState extends FireBaseState {}

class CodeSendSate extends FireBaseState {}

class CodeSuccessState extends FireBaseState {}

class CodeUnSuccessState extends FireBaseState {}

class CodeTimeOutState extends FireBaseState {}

class ErrorState extends FireBaseState {
  String? errorMessage;
  ErrorState({this.errorMessage});
}
