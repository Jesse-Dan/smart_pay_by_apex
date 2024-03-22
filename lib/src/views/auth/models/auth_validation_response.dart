// To parse this JSON data, do
//
//     final authValidationResponse = authValidationResponseFromJson(jsonString);

import 'dart:convert';

AuthValidationResponse authValidationResponseFromJson(String str) => AuthValidationResponse.fromJson(json.decode(str));

String authValidationResponseToJson(AuthValidationResponse data) => json.encode(data.toJson());

class AuthValidationResponse {
    bool? status;
    String? message;
    List<dynamic>? data;
    List<dynamic>? meta;
    Errors? errors;

    AuthValidationResponse({
        this.status,
        this.message,
        this.data,
        this.meta,
        this.errors,
    });

    AuthValidationResponse copyWith({
        bool? status,
        String? message,
        List<dynamic>? data,
        List<dynamic>? meta,
        Errors? errors,
    }) => 
        AuthValidationResponse(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
            meta: meta ?? this.meta,
            errors: errors ?? this.errors,
        );

    factory AuthValidationResponse.fromJson(Map<String, dynamic> json) => AuthValidationResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
        meta: json["meta"] == null ? [] : List<dynamic>.from(json["meta"]!.map((x) => x)),
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
        "errors": errors?.toJson(),
    };
}

class Errors {
    List<String>? email;
    List<String>? password;
    List<String>? country;

    Errors({
        this.email,
        this.password,
        this.country,
    });

    Errors copyWith({
        List<String>? email,
        List<String>? password,
        List<String>? country,
    }) => 
        Errors(
            email: email ?? this.email,
            password: password ?? this.password,
            country: country ?? this.country,
        );

    factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        email: json["email"] == null ? [] : List<String>.from(json["email"]!.map((x) => x)),
        password: json["password"] == null ? [] : List<String>.from(json["password"]!.map((x) => x)),
        country: json["country"] == null ? [] : List<String>.from(json["country"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "email": email == null ? [] : List<dynamic>.from(email!.map((x) => x)),
        "password": password == null ? [] : List<dynamic>.from(password!.map((x) => x)),
        "country": country == null ? [] : List<dynamic>.from(country!.map((x) => x)),
    };
}
