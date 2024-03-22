// To parse this JSON data, do
//
//     final signinSignupResponse = signinSignupResponseFromJson(jsonString);

import 'dart:convert';

SignInResponse signinSignupResponseFromJson(String str) =>
    SignInResponse.fromJson(json.decode(str));

String signinSignupResponseToJson(SignInResponse data) =>
    json.encode(data.toJson());

class SignInResponse {
  bool? status;
  String? message;
  Data? data;
  List<dynamic>? meta;
  List<dynamic>? pagination;

  SignInResponse({
    this.status,
    this.message,
    this.data,
    this.meta,
    this.pagination,
  });

  SignInResponse copyWith({
    bool? status,
    String? message,
    Data? data,
    List<dynamic>? meta,
    List<dynamic>? pagination,
  }) =>
      SignInResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        meta: meta ?? this.meta,
        pagination: pagination ?? this.pagination,
      );

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        meta: json["meta"] == null
            ? []
            : List<dynamic>.from(json["meta"]!.map((x) => x)),
        pagination: json["pagination"] == null
            ? []
            : List<dynamic>.from(json["pagination"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
        "pagination": pagination == null
            ? []
            : List<dynamic>.from(pagination!.map((x) => x)),
      };
}

class Data {
  User? user;
  String? token;

  Data({
    this.user,
    this.token,
  });

  Data copyWith({
    User? user,
    String? token,
  }) =>
      Data(
        user: user ?? this.user,
        token: token ?? this.token,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
      };
}

class User {
  String? id;
  String? fullName;
  String? username;
  String? email;
  dynamic phone;
  dynamic phoneCountry;
  String? country;
  dynamic avatar;

  User({
    this.id,
    this.fullName,
    this.username,
    this.email,
    this.phone,
    this.phoneCountry,
    this.country,
    this.avatar,
  });

  User copyWith({
    String? id,
    String? fullName,
    String? username,
    String? email,
    dynamic phone,
    dynamic phoneCountry,
    String? country,
    dynamic avatar,
  }) =>
      User(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        username: username ?? this.username,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        phoneCountry: phoneCountry ?? this.phoneCountry,
        country: country ?? this.country,
        avatar: avatar ?? this.avatar,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        phoneCountry: json["phone_country"],
        country: json["country"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "username": username,
        "email": email,
        "phone": phone,
        "phone_country": phoneCountry,
        "country": country,
        "avatar": avatar,
      };
}
