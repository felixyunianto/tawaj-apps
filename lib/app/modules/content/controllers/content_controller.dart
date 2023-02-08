import 'dart:convert';

import 'package:get/get.dart';
import 'package:tawaj/app/data/models/content.dart';
import 'package:http/http.dart' as http;

class ContentController extends GetxController {
  var title = "".obs;

  void changeTitleAppBar(String text) {
    title.value = text;
  }

  Future<Content> getCotentDetail(String id) async {
    Uri uri = Uri.parse("http://localhost:8000/api/content/${id}");
    var res = await http.get(uri);

    Map<String, dynamic> data = (json.decode(res.body) as Map<String,dynamic>)["data"];
    changeTitleAppBar(Content.fromJson(data).titleArab);
    update();

    return Content.fromJson(data);
  }
}
