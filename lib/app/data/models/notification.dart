import 'dart:convert';

NotificationModel bigButtonFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String bigButtonToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.id,
    this.title,
    this.text,
    this.image,
    this.timeScheduled,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? text;
  String? image;
  DateTime? timeScheduled;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        title: json["title"],
        text: json["text"],
        image: json["image"],
        timeScheduled: json["time_scheduled"] != null
            ? DateTime.parse(json["time_scheduled"])
            : null,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "text": text,
        "image": image,
        "time_scheduled": createdAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
