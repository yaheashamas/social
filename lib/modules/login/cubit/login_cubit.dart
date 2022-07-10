import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  //var
  String? mesSuccess;
  bool isSecure = true;
  IconData iconSuffix = Icons.remove_red_eye;

  //function
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value);
      emit(LoginSuccessState(uId: value.user!.uid));
    }).catchError((error) {
      emit(LoginErrorState(error: error.toString()));
    });
  }

  void changeStateSecure() {
    isSecure = !isSecure;
    isSecure
        ? iconSuffix = Icons.remove_red_eye
        : iconSuffix = Icons.visibility_off_rounded;
    emit(LoginSecureInputState());
  }
}
