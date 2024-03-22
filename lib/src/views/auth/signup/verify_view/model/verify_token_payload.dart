// To parse this JSON data, do
//
//     final verifyTokenPayload = verifyTokenPayloadFromJson(jsonString);

import 'dart:convert';

VerifyTokenPayload verifyTokenPayloadFromJson(String str) => VerifyTokenPayload.fromJson(json.decode(str));

String verifyTokenPayloadToJson(VerifyTokenPayload data) => json.encode(data.toJson());

class VerifyTokenPayload {
    String? email;
    String? token;

    VerifyTokenPayload({
        this.email,
        this.token,
    });

    VerifyTokenPayload copyWith({
        String? email,
        String? token,
    }) => 
        VerifyTokenPayload(
            email: email ?? this.email,
            token: token ?? this.token,
        );

    factory VerifyTokenPayload.fromJson(Map<String, dynamic> json) => VerifyTokenPayload(
        email: json["email"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "token": token,
    };
}
