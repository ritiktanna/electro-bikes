import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:electro_bikes/bloc/internet_bloc/internet_event.dart';
import 'package:electro_bikes/bloc/internet_bloc/internet_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? connectivitySubscription;
  InternetBloc() : super(InitialState()) {
    on<InternetLostEvent>((event, emit) => emit(LostConnectionState()));
    on<InternetGainEvent>((event, emit) => emit(ConnectedState()));
    connectivitySubscription = connectivity.onConnectivityChanged.listen(
      (event) {
        if (event == ConnectivityResult.mobile ||
            event == ConnectivityResult.wifi) {
          try {
            add(InternetGainEvent());
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
        } else {
          add(
            InternetLostEvent(),
          );
        }
      },
    );
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
