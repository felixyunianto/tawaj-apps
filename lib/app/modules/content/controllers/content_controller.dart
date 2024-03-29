import 'dart:convert';

import 'package:get/get.dart';
import 'package:tawaj/app/data/models/content.dart';
import 'package:http/http.dart' as http;
import 'package:tawaj/app/data/constants/constants.dart' as constants;

class ContentController extends GetxController {
  var title = "".obs;
  var statusToggleLatin = false.obs;
  var statusToggleIndo = false.obs;

  void changeTitleAppBar(String text) {
    title.value = text;
  }

  void changeStatusToggleLatin(bool status) {
    statusToggleLatin.value = status;
    update();
  }

  void changeStatusToggleIndo(bool status) {
    statusToggleIndo.value = status;
    update();
  }

  Future<Content> getCotentDetail(String id) async {
    Uri uri = Uri.parse("${constants.BASE_URL_API}/api/content/${id}");
    var res = await http.get(uri);

    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];
    changeTitleAppBar(Content.fromJson(data).titleArab ?? Content.fromJson(data).titleIndo);
    update();

    return Content.fromJson(data);
  }
}
