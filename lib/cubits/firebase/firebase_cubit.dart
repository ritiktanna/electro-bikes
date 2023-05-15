import 'package:electro_bikes/cubits/firebase/firebase_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FireBaseCubit extends Cubit<FireBaseState> {
  String? _verificationId;
  final _auth = FirebaseAuth.instance;
  FireBaseCubit() : super(InitialState());
  void sendOTP(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) {
          signInWithPhone(credential);
        },
        verificationFailed: (error) {
          emit(ErrorState(errorMessage: error.message.toString()));
        },
        codeSent: (verificationId, reSendToken) {
          _verificationId = verificationId;
          emit(CodeSendSate());
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _verificationId = verificationId;
        });
  }
}

void signInWithPhone(PhoneAuthCredential credential) async {}
