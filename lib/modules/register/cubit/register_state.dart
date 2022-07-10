part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String? error;
  RegisterErrorState({this.error});
}

class RegisterCreateUserSuccessState extends RegisterState {}

class RegisterCreateUserErrorState extends RegisterState {
  final String? error;
  RegisterCreateUserErrorState({this.error});
}

class RegisterSecureInputState extends RegisterState {}
