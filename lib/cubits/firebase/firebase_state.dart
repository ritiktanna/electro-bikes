abstract class FireBaseState {}

class InitialState extends FireBaseState {}

class CodeSendSate extends FireBaseState {}

class CodeSuccessState extends FireBaseState {}

class CodeUnSuccessState extends FireBaseState {}

class CodeTimeOutState extends FireBaseState {}

class FireBaseErrorState extends FireBaseState {
  String? errorMessage;
  FireBaseErrorState({this.errorMessage});
}

class SignInState extends FireBaseState {}
