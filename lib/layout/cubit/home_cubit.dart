import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/components/constants.dart';
import 'package:social/layout/cubit/home_state.dart';
import 'package:social/models/social_user.dart';
import 'package:social/modules/chats/chats_screen.dart';
import 'package:social/modules/feeds/feed_screen.dart';
import 'package:social/modules/new_post/new_post_screen.dart';
import 'package:social/modules/settings/settings_screen.dart';
import 'package:social/modules/users/users_screen.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  SocialUser? user;
  List<Widget> screen = [
    FeedScreen(),
    ChatsScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingsScreen()
  ];
  List<String> titles = ["Home", "Chate", "Add New Post", "Users", "Setting"];
  int currentIndex = 0;

  void getUser() {
    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection("users").doc(uId).get().then((value) {
      user = SocialUser.fromJson(value.data()!);
      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(GetUserErrorState(error: error));
    });
  }

  void changeCurrentIndexNavBar(int index) {
    if (index == 2) {
      emit(MoveToAddNewPostState());
    } else {
      currentIndex = index;
      emit(ChangeButtonNavState());
    }
  }
}
