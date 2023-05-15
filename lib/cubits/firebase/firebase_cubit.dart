import 'package:electro_bikes/cubits/firebase/firebase_state.dart';
import 'package:electro_bikes/screens/otp_page/opt_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FireBaseCubit extends Cubit<FireBaseState> {
  String? _verificationId;
  final _auth = FirebaseAuth.instance;
  String? phoneNumber;
  FireBaseCubit() : super(InitialState());

  void sendOTP(String number) async {
    phoneNumber = number;
    print('$number this is number');
    _auth.verifyPhoneNumber(
        phoneNumber: '+${number}',
        verificationCompleted: (authCredential) {
          emit(CodeSuccessState());
        },
        verificationFailed: (authException) {
          emit(CodeUnSuccessState());
        },
        codeSent: (verificationId, forceResendToken) {
          _verificationId = verificationId;
          emit(CodeSendSate());
        },
        codeAutoRetrievalTimeout: (codeAutoRetrievalTimeout) {
          emit(CodeTimeOutState());
        });
  }

  void verifyOTP(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otpCode);
    signIn(credential);
  }

  void signIn(PhoneAuthCredential credential) async {
    OTPPage.number = phoneNumber!;
    emit(SignInState());
    try {
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (error) {
      emit(
        FireBaseErrorState(errorMessage: error.message),
      );
    }
  }
}
