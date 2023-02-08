import 'dart:convert';

Sort surahFromJson(String str) => Sort.fromJson(json.decode(str));

String surahToJson(Sort data) => json.encode(data.toJson());

class Sort{
  Sort({
    this.name,
    this.code,
    this.order
  });

  String? name;
  String? code;
  dynamic? order;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
    name : json['name'],
    code : json['code'],
    order : json['order'],
  );

  Map<String, dynamic> toJson() => {
    "name" : name,
    "code" : code,
    "order" : order,
  };
}