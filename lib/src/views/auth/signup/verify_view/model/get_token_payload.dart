// To parse this JSON data, do
//
//     final getTokenPayload = getTokenPayloadFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

GetTokenPayload getTokenPayloadFromJson(String str) =>
    GetTokenPayload.fromJson(json.decode(str));

String getTokenPayloadToJson(GetTokenPayload data) =>
    json.encode(data.toJson());

class GetTokenPayload {
  String? email;

  GetTokenPayload({
    this.email,
  });

  GetTokenPayload copyWith({
    String? email,
  }) =>
      GetTokenPayload(
        email: email ?? this.email,
      );

  factory GetTokenPayload.fromJson(Map<String, dynamic> json) =>
      GetTokenPayload(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
