import 'package:equatable/equatable.dart';
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

  // //function
  // void userLogin({
  //   required String email,
  //   required String password,
  // }) {
  //   emit(LoginLoadingState());

  //   DioHelper.postData(
  //     url: LOGIN,
  //     data: {
  //       "email": email,
  //       "password": password,
  //     },
  //   ).then((value) {
  //     loginModel = LoginModel.fromJson(value.data);
  //     emit(LoginSuccessState(loginModel));
  //   }).catchError((error) {
  //     print(error);
  //     emit(LoginErrorState(error: error));
  //   });
  // }

  void changeStateSecure() {
    isSecure = !isSecure;
    isSecure
        ? iconSuffix = Icons.remove_red_eye
        : iconSuffix = Icons.visibility_off_rounded;
    emit(LoginSecureInputState());
  }
}
