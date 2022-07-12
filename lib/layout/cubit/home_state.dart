abstract class HomeState {}

class InitialState extends HomeState {}

class GetUserLoadingState extends HomeState {}

class GetUserSuccessState extends HomeState {}

class GetUserErrorState extends HomeState {
  final String error;
  GetUserErrorState({required this.error});
}

class ChangeButtonNavState extends HomeState {}
class MoveToAddNewPostState extends HomeState {}
