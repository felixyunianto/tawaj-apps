// To parse this JSON data, do
//
//     final content = contentFromJson(jsonString);

import 'dart:convert';

Content contentFromJson(String str) => Content.fromJson(json.decode(str));

String contentToJson(Content data) => json.encode(data.toJson());

class Content {
    Content({
        required this.titleIndo,
        required this.titleArab,
        required this.content,
    });

    String titleIndo;
    String titleArab;
    List<ContentElement> content;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        titleIndo: json["title_indo"],
        titleArab: json["title_arab"],
        content: List<ContentElement>.from(json["content"].map((x) => ContentElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title_indo": titleIndo,
        "title_arab": titleArab,
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
    };
}

class ContentElement {
    ContentElement({
        required this.indo,
        required this.arab,
        required this.latin,
    });

    String? indo;
    String? arab;
    String? latin;

    factory ContentElement.fromJson(Map<String, dynamic> json) => ContentElement(
        indo: json["indo"],
        arab: json["arab"],
        latin: json["latin"],
    );

    Map<String, dynamic> toJson() => {
        "indo": indo,
        "arab": arab,
        "latin": latin,
    };
}
