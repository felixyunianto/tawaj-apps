// To parse this JSON data, do
//
//     final content = contentFromJson(jsonString);

import 'dart:convert';

Search contentFromJson(String str) => Search.fromJson(json.decode(str));

String contentToJson(Search data) => json.encode(data.toJson());

class Search {
  Search({
    required this.id,
    required this.titleIndo,
    required this.titleArab,
  });

  dynamic id;
  String titleIndo;
  String? titleArab;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        id: json["id"],
        titleIndo: json["title_indo"],
        titleArab: json["title_arab"] != null ? json['title_arab'] : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title_indo": titleIndo,
        "title_arab": titleArab,
      };
}
