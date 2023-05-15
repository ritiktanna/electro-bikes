import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:electro_bikes/cubits/internet/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<CubitInternetState> {
  final Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? connectivitySubscription;
  InternetCubit() : super(InternetInitialState()) {
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        emit(InternetGainState(message: 'You are back online'));
      } else {
        emit(InternetLostState(errorMessage: 'There is no Internet!'));
      }
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    connectivitySubscription?.cancel();
    return super.close();
  }
}
