// To parse this JSON data, do
//
//     final unAuthResponse = unAuthResponseFromJson(jsonString);

import 'dart:convert';

GeneralErrorResponse unAuthResponseFromJson(String str) =>
    GeneralErrorResponse.fromJson(json.decode(str));

String unAuthResponseToJson(GeneralErrorResponse data) =>
    json.encode(data.toJson());

class GeneralErrorResponse {
  final bool? status;
  final int? statusCode;
  final String? message;
  final dynamic data;

  GeneralErrorResponse({this.status, this.statusCode, this.message, this.data});

  GeneralErrorResponse copyWith({
    bool? status,
    int? statusCode,
    String? message,
    String? data,
  }) =>
      GeneralErrorResponse(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory GeneralErrorResponse.fromJson(Map<String, dynamic> json) =>
      GeneralErrorResponse(
        status: json["status"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "message": message,
        'data': data
      };
}
