import 'dart:convert';
import 'dart:ffi';

ButtonPage surahFromJson(String str) => ButtonPage.fromJson(json.decode(str));

String surahToJson(ButtonPage data) => json.encode(data.toJson());

class ButtonPage {
  ButtonPage({
    required this.id,
    required this.title,
    required this.title2,
    required this.deskripsi,
    required this.linkType,
    required this.link,
    this.order,
    this.buttonPageId,
    required this.createdAt,
    required this.updatedAt,
    this.children,
  });

  int id;
  String title;
  String title2;
  String deskripsi;
  String linkType;
  String link;
  dynamic? order;
  dynamic buttonPageId;
  DateTime createdAt;
  DateTime updatedAt;
  List<ButtonPage>? children;

  factory ButtonPage.fromJson(Map<String, dynamic> json) => ButtonPage(
        id: json["id"],
        title: json["title"],
        title2: json["title2"],
        deskripsi: json["deskripsi"],
        linkType: json["link_type"],
        link: json["link"],
        order: json["order"],
        buttonPageId: json["button_page_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        children: json["children"] == null
            ? []
            : List<ButtonPage>.from(
                json["children"]!.map((x) => ButtonPage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "title2": title2,
        "deskripsi": deskripsi,
        "link_type": linkType,
        "link": link,
        "order": order,
        "button_page_id": buttonPageId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
      };
}
