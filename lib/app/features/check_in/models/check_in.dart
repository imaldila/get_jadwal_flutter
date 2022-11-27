import 'dart:convert';

CheckIn checkInFromJson(String str) => CheckIn.fromJson(json.decode(str));

String checkInToJson(CheckIn data) => json.encode(data.toJson());

class CheckIn {
  CheckIn({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final Data? data;

  factory CheckIn.fromJson(Map<String, dynamic> json) => CheckIn(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.email,
    this.updatedAt,
    this.createdAt,
  });

  final int? id;
  final String? email;
  final DateTime? updatedAt;
  final DateTime? createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "updatedAt": updatedAt!.toIso8601String(),
        "createdAt": createdAt!.toIso8601String(),
      };
}
