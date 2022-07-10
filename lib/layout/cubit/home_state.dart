import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends HomeState {}

class GetUserLoadingState extends HomeState {}

class GetUserSuccessState extends HomeState {}

class GetUserErrorState extends HomeState {
  final String error;
  GetUserErrorState({required this.error});
}
