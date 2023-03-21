import 'dart:convert';

BigTabModel bigTabFromJson(String str) => BigTabModel.fromJson(json.decode(str));

String bigTabToJson(BigTabModel data) => json.encode(data.toJson());

class BigTabModel {
    BigTabModel({
        required this.id,
        required this.title,
        required this.description,
        required this.linkType,
        required this.link,
        required this.image,
        required this.typeButton,
        required this.createdAt,
        required this.updatedAt,
    });

    int? id;
    String? title;
    String? description;
    String? linkType;
    String? link;
    String? image;
    dynamic  typeButton;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory BigTabModel.fromJson(Map<String, dynamic> json) => BigTabModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        linkType: json["link_type"],
        link: json["link"],
        image: json["image"],
        typeButton: json["type_button"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "link_type": linkType,
        "link": link,
        "image": image,
        "type_button": typeButton,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
