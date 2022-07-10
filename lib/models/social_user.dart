import 'package:firebase_auth/firebase_auth.dart';

class User {
  late final String name;

  late final String email;

  late final String photo;

  late final String uId;

  User({
    required this.name,
    required this.email,
    required this.photo,
    required this.uId,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    photo = json["photo"];
    uId = json["uId"];
  }

  Map<String, dynamic> toMap() {
    return {
      'name' : name,
      'email' : email,
      'photo' : photo,
      'uId' : uId,
    };
  }
}
