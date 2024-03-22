// To parse this JSON data, do
//
//     final verifyTokenResponse = verifyTokenResponseFromJson(jsonString);

import 'dart:convert';

VerifyTokenResponse verifyTokenResponseFromJson(String str) => VerifyTokenResponse.fromJson(json.decode(str));

String verifyTokenResponseToJson(VerifyTokenResponse data) => json.encode(data.toJson());

class VerifyTokenResponse {
    bool? status;
    String? message;
    Data? data;
    List<dynamic>? meta;
    List<dynamic>? pagination;

    VerifyTokenResponse({
        this.status,
        this.message,
        this.data,
        this.meta,
        this.pagination,
    });

    VerifyTokenResponse copyWith({
        bool? status,
        String? message,
        Data? data,
        List<dynamic>? meta,
        List<dynamic>? pagination,
    }) => 
        VerifyTokenResponse(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
            meta: meta ?? this.meta,
            pagination: pagination ?? this.pagination,
        );

    factory VerifyTokenResponse.fromJson(Map<String, dynamic> json) => VerifyTokenResponse(
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
    String? email;

    Data({
        this.email,
    });

    Data copyWith({
        String? email,
    }) => 
        Data(
            email: email ?? this.email,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
    };
}
