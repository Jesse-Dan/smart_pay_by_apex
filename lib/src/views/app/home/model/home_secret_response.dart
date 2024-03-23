// To parse this JSON data, do
//
//     final homeSecretResponse = homeSecretResponseFromJson(jsonString);

import 'dart:convert';

HomeSecretResponse homeSecretResponseFromJson(String str) => HomeSecretResponse.fromJson(json.decode(str));

String homeSecretResponseToJson(HomeSecretResponse data) => json.encode(data.toJson());

class HomeSecretResponse {
    bool? status;
    String? message;
    Data? data;
    List<dynamic>? meta;
    List<dynamic>? pagination;

    HomeSecretResponse({
        this.status,
        this.message,
        this.data,
        this.meta,
        this.pagination,
    });

    HomeSecretResponse copyWith({
        bool? status,
        String? message,
        Data? data,
        List<dynamic>? meta,
        List<dynamic>? pagination,
    }) => 
        HomeSecretResponse(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
            meta: meta ?? this.meta,
            pagination: pagination ?? this.pagination,
        );

    factory HomeSecretResponse.fromJson(Map<String, dynamic> json) => HomeSecretResponse(
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
    String? secret;

    Data({
        this.secret,
    });

    Data copyWith({
        String? secret,
    }) => 
        Data(
            secret: secret ?? this.secret,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        secret: json["secret"],
    );

    Map<String, dynamic> toJson() => {
        "secret": secret,
    };
}
