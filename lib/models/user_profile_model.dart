// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
    UserProfileModel({
        required this.id,
        required this.name,
        required this.phone,
        this.role,
        this.verified,
        this.createdAt,
        this.v,
        required this.email,
        required this.profile,
    });

    String id;
    String name;
    String phone;
    String ? role;
    bool? verified;
    DateTime ?createdAt;
    int? v;
    String email;
    String profile;

    factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
        id: json["_id"],
        name: json["name"],
        phone: json["phone"],
        role: json["role"],
        verified: json["verified"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        email: json["email"],
        profile: json["profile"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phone": phone,
        "role": role,
        "verified": verified,
        "createdAt": createdAt!.toIso8601String(),
        "__v": v,
        "email": email,
        "profile": profile,
    };
}
