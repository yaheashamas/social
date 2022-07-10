import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/components/constants.dart';
import 'package:social/layout/cubit/home_state.dart';
import 'package:social/models/social_user.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  SocialUser? user;

  void getUser() {
    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection("users").doc(uId).get().then((value) {
      print(value.data());
      user = SocialUser.fromJson(value.data()!);
      print("user is => ${user}");
      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(GetUserErrorState(error: error));
    });
  }

  void call() {}
}
