// To parse this JSON data, do
//
//     final signInPayload = signInPayloadFromJson(jsonString);

import 'dart:convert';

SignInPayload signInPayloadFromJson(String str) => SignInPayload.fromJson(json.decode(str));

String signInPayloadToJson(SignInPayload data) => json.encode(data.toJson());

class SignInPayload {
    String? email;
    String? password;
    String? deviceName;

    SignInPayload({
        this.email,
        this.password,
        this.deviceName,
    });

    SignInPayload copyWith({
        String? email,
        String? password,
        String? deviceName,
    }) => 
        SignInPayload(
            email: email ?? this.email,
            password: password ?? this.password,
            deviceName: deviceName ?? this.deviceName,
        );

    factory SignInPayload.fromJson(Map<String, dynamic> json) => SignInPayload(
        email: json["email"],
        password: json["password"],
        deviceName: json["device_name"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "device_name": deviceName,
    };
}
