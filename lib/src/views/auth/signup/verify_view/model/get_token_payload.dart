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
  BuildContext context;

  GetTokenPayload({
    this.email,
    required this.context,
  });

  GetTokenPayload copyWith({
    String? email,
  }) =>
      GetTokenPayload(
        email: email ?? this.email,
        context: context ?? context,
      );

  factory GetTokenPayload.fromJson(Map<String, dynamic> json) =>
      GetTokenPayload(
        email: json["email"],
        context: json["context"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "context": context,
      };
}
