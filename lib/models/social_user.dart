class SocialUser {
  late final String name;

  late final String email;

  late final String phone;

  late final String uId;

  late final bool isEmailVerified;

  String? cover;
  String? image;
  String? bio;

  SocialUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    required this.isEmailVerified,
    this.cover,
    this.image,
    this.bio,
  });

  SocialUser.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    uId = json["uId"];
    isEmailVerified = json["isEmailVerified"];
    cover = json["cover"];
    image = json["image"];
    bio = json["bio"];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
      'cover': cover,
      'image': image,
      'bio': bio,
    };
  }
}
