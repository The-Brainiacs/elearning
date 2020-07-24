import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.user,
    this.password,
  });

  String user;
  String password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: json["user"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "password": password,
      };
}
