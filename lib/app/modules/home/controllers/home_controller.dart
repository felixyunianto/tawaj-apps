import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tawaj/app/data/models/highlight.dart';
import 'package:tawaj/app/data/models/sort_model.dart';

class HomeController extends GetxController {
  Future<List<Sort>> getSort() async {
    Uri url = Uri.parse("http://localhost:8000/api/home");
    var res = await http.get(url);

    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Sort.fromJson(e)).toList();
    }
  }

  Future<List<HighlightModel>> getHighlight() async {
    Uri url = Uri.parse("http://localhost:8000/api/highlight");
    var res = await http.get(url);

    List? data = (json.decode((res.body)) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => HighlightModel.fromJson(e)).toList();
    }
  }
}
