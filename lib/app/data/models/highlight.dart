// To parse this JSON data, do
//
//     final highlightModel = highlightModelFromJson(jsonString);

import 'dart:convert';

HighlightModel highlightModelFromJson(String str) => HighlightModel.fromJson(json.decode(str));

String highlightModelToJson(HighlightModel data) => json.encode(data.toJson());

class HighlightModel {
    HighlightModel({
        required this.id,
        required this.images,
        required this.title,
        required this.description,
        required this.linkType,
        required this.link,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String images;
    String title;
    String description;
    String linkType;
    String link;
    DateTime createdAt;
    DateTime updatedAt;

    factory HighlightModel.fromJson(Map<String, dynamic> json) => HighlightModel(
        id: json["id"],
        images: json["images"],
        title: json["title"],
        description: json["description"],
        linkType: json["link_type"],
        link: json["link"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "images": images,
        "title": title,
        "description": description,
        "link_type": linkType,
        "link": link,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
