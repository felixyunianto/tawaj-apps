import 'dart:convert';

BigButtonModel bigButtonFromJson(String str) => BigButtonModel.fromJson(json.decode(str));

String bigButtonToJson(BigButtonModel data) => json.encode(data.toJson());

class BigButtonModel {
    BigButtonModel({
        this.id,
        this.image,
        this.title,
        this.linkType,
        this.link,
        this.isShowed,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? image;
    String? title;
    String? linkType;
    String? link;
    String? isShowed;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory BigButtonModel.fromJson(Map<String, dynamic> json) => BigButtonModel(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        linkType: json["link_type"],
        link: json["link"],
        isShowed: json["is_showed"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "link_type": linkType,
        "link": link,
        "is_showed": isShowed,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
