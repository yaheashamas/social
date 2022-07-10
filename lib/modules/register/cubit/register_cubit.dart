import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  //var
  String? mesSuccess;
  bool isSecure = true;
  IconData iconSuffix = Icons.remove_red_eye;

  //function
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(RegisterLoadingState());

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterErrorState(error: error));
    });
  }

  void changeStateSecure() {
    isSecure = !isSecure;
    isSecure
        ? iconSuffix = Icons.remove_red_eye
        : iconSuffix = Icons.visibility_off_rounded;
    emit(RegisterSecureInputState());
  }
}
