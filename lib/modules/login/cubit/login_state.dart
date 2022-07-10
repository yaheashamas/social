part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String uId;
  LoginSuccessState({required this.uId});
}

class LoginErrorState extends LoginState {
  final String? error;
  LoginErrorState({this.error});
}

//change state secure input password
class LoginSecureInputState extends LoginState {}
