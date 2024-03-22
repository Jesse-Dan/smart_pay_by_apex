// To parse this JSON data, do
//
//     final signUpPayload = signUpPayloadFromJson(jsonString);

import 'dart:convert';

SignUpPayload signUpPayloadFromJson(String str) => SignUpPayload.fromJson(json.decode(str));

String signUpPayloadToJson(SignUpPayload data) => json.encode(data.toJson());

class SignUpPayload {
    String? fullName;
    String? username;
    String? email;
    String? country;
    String? password;
    String? deviceName;

    SignUpPayload({
        this.fullName,
        this.username,
        this.email,
        this.country,
        this.password,
        this.deviceName,
    });

    SignUpPayload copyWith({
        String? fullName,
        String? username,
        String? email,
        String? country,
        String? password,
        String? deviceName,
    }) => 
        SignUpPayload(
            fullName: fullName ?? this.fullName,
            username: username ?? this.username,
            email: email ?? this.email,
            country: country ?? this.country,
            password: password ?? this.password,
            deviceName: deviceName ?? this.deviceName,
        );

    factory SignUpPayload.fromJson(Map<String, dynamic> json) => SignUpPayload(
        fullName: json["full_name"],
        username: json["username"],
        email: json["email"],
        country: json["country"],
        password: json["password"],
        deviceName: json["device_name"],
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "username": username,
        "email": email,
        "country": country,
        "password": password,
        "device_name": deviceName,
    };
}
