import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/models/social_user.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  String coverImage =
      "https://img.freepik.com/free-photo/pizza-time-tasty-homemade-traditional-pizza-italian-recipe_144627-42528.jpg?t=st=1657578242~exp=1657578842~hmac=00b6e76bce16d2c8f55c554278c5872fe7a6f24397a4bb960dc2dbe7aa611010&w=740";
  String profileImage =
      "https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1657578304~exp=1657578904~hmac=a535570fd953b84084a51572a032c129a98ad72b375bfa2b92f3e012939ca25a&w=740";
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
      createUser(
        name: name,
        email: email,
        phone: phone,
        uId: value.user!.uid,
        isUserVerified: value.user!.emailVerified,
      );
    }).catchError((error) {
      emit(RegisterErrorState(error: error));
    });
  }

  void createUser({
    required String name,
    required String email,
    required String phone,
    required String uId,
    required bool isUserVerified,
  }) {
    SocialUser user = SocialUser(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      isEmailVerified: isUserVerified,
      image: profileImage,
      cover: coverImage,
      bio: "Write Your Bio",
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(user.toMap())
        .then((value) {
      emit(RegisterCreateUserSuccessState());
    }).catchError((error) {
      emit(RegisterCreateUserErrorState(error: error));
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
