import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tawaj/app/data/models/big_button.dart';
import 'package:tawaj/app/data/models/big_tab.dart';
import 'package:tawaj/app/data/models/highlight.dart';
import 'package:tawaj/app/data/models/sort_model.dart';
import 'package:tawaj/app/data/constants/constants.dart' as constants;
import 'package:tawaj/app/routes/app_pages.dart';

class HomeController extends GetxController {
  Future<List<Sort>> getSort() async {
    Uri url = Uri.parse("${constants.BASE_URL_API}/api/home");
    var res = await http.get(url);

    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Sort.fromJson(e)).toList();
    }
  }

  Future<List<HighlightModel>> getHighlight() async {
    Uri url = Uri.parse("${constants.BASE_URL_API}/api/highlight");
    var res = await http.get(url);

    List? data = (json.decode((res.body)) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => HighlightModel.fromJson(e)).toList();
    }
  }

  Future<List<BigButtonModel>> getBigButton() async {
    Uri url = Uri.parse("${constants.BASE_URL_API}/api/big-button");
    var res = await http.get(url);

    List? data = (json.decode((res.body)) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => BigButtonModel.fromJson(e)).toList();
    }
  }

  void redirectClick(String url, String linkType) {
    if (linkType == constants.ARTICLE_LINK_TYPE) {
      Get.toNamed(Routes.ARTICLE, arguments: url);
    } else if (linkType == constants.CONTENT_LINK_TYPE) {
      Get.toNamed(Routes.CONTENT, arguments: int.parse(url));
    } else {
      Get.toNamed(Routes.BUTTON_PAGES, arguments: int.parse(url));
    }
  }

  Future<List<BigTabModel>> getBigTabs() async {
    Uri url = Uri.parse("${constants.BASE_URL_API}/api/big-tab");
    var res = await http.get(url);

    List? data = (json.decode((res.body)) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => BigTabModel.fromJson(e)).toList();
    }
  }
}
