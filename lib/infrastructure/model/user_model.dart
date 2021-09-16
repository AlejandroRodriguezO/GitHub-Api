// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.data,
    });

    final Data? data;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.viewer,
    });

    final Viewer? viewer;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        viewer: Viewer.fromJson(json["viewer"]),
    );

    Map<String, dynamic> toJson() => {
        "viewer": viewer!.toJson(),
    };
}

class Viewer {
    Viewer({
        this.avatarUrl,
        this.bio,
        this.createdAt,
        this.email,
        this.login,
        this.location,
    });

  final String? avatarUrl;
  final String? bio;
  final DateTime? createdAt;
  final String? email;
  final String? login;
  final String? location;

    factory Viewer.fromJson(Map<String, dynamic> json) => Viewer(
        avatarUrl: json["avatarUrl"],
        bio: json["bio"],
        createdAt: DateTime.parse(json["createdAt"]),
        email: json["email"],
        login: json["login"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "avatarUrl": avatarUrl,
        "bio": bio,
        "createdAt": createdAt!.toIso8601String(),
        "email": email,
        "login": login,
        "location": location,
    };
}
