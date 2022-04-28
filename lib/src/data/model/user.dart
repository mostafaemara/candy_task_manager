import 'dart:convert';

class User {
  User(
      {required this.email,
      required this.uid,
      required this.token,
      required this.profilePic});

  final String email;
  final String uid;
  final String token;
  final String profilePic;

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'uid': uid,
      'token': token,
      'profilePic': profilePic,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
      token: map['token'] ?? '',
      profilePic: map['profilePic'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
