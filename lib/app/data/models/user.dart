import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.name,
        this.username,
        this.email,
        this.nickname,
        this.whatsapp,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.token,
    });

    String? name;
    String? username;
    String? email;
    String? nickname;
    String? whatsapp;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;
    String? token;

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        username: json["username"],
        email: json["email"],
        nickname: json["nickname"],
        whatsapp: json["whatsapp"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "email": email,
        "nickname": nickname,
        "whatsapp": whatsapp,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "token": token,
    };
}