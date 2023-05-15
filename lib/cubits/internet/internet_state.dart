abstract class CubitInternetState {}

class InternetInitialState extends CubitInternetState {}

class InternetLostState extends CubitInternetState {
  String? errorMessage;
  InternetLostState({this.errorMessage});
}

class InternetGainState extends CubitInternetState {
  String? message;
  InternetGainState({this.message});
}
