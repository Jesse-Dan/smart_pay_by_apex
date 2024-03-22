// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString);

import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) => SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
    bool? status;
    String? message;
    Data? data;
    List<dynamic>? meta;
    List<dynamic>? pagination;

    SignUpResponse({
        this.status,
        this.message,
        this.data,
        this.meta,
        this.pagination,
    });

    SignUpResponse copyWith({
        bool? status,
        String? message,
        Data? data,
        List<dynamic>? meta,
        List<dynamic>? pagination,
    }) => 
        SignUpResponse(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
            meta: meta ?? this.meta,
            pagination: pagination ?? this.pagination,
        );

    factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        meta: json["meta"] == null ? [] : List<dynamic>.from(json["meta"]!.map((x) => x)),
        pagination: json["pagination"] == null ? [] : List<dynamic>.from(json["pagination"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
        "pagination": pagination == null ? [] : List<dynamic>.from(pagination!.map((x) => x)),
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
    String? fullName;
    String? username;
    String? email;
    String? country;
    String? id;

    User({
        this.fullName,
        this.username,
        this.email,
        this.country,
        this.id,
    });

    User copyWith({
        String? fullName,
        String? username,
        String? email,
        String? country,
        String? id,
    }) => 
        User(
            fullName: fullName ?? this.fullName,
            username: username ?? this.username,
            email: email ?? this.email,
            country: country ?? this.country,
            id: id ?? this.id,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["full_name"],
        username: json["username"],
        email: json["email"],
        country: json["country"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "username": username,
        "email": email,
        "country": country,
        "id": id,
    };
}
