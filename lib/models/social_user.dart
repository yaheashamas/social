class SocialUser {
  late final String name;

  late final String email;

  late final String photo;

  late final String uId;

  late final bool isEmailVerified;

  SocialUser({
    required this.name,
    required this.email,
    required this.photo,
    required this.uId,
    required this.isEmailVerified,
  });

  SocialUser.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    photo = json["photo"];
    uId = json["uId"];
    isEmailVerified = json["isEmailVerified"];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'photo': photo,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
    };
  }
}
