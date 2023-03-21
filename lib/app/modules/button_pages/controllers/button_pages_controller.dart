import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tawaj/app/data/models/button_page.dart';
import 'package:tawaj/app/data/constants/constants.dart' as constants;
import 'package:tawaj/app/routes/app_pages.dart';

class ButtonPagesController extends GetxController {
  var title = "".obs;

  void changeTitleAppBar(String text) {
    title.value = text;
  }

  void redirectClick(String url, String linkType) {
    print("URL ${linkType}" );
    if (linkType == constants.ARTICLE_LINK_TYPE) {
      Get.toNamed(Routes.ARTICLE, arguments: url);
    } else if (linkType == constants.CONTENT_LINK_TYPE) {
      Get.toNamed(Routes.CONTENT, arguments: int.parse(url));
    } else {
      Get.toNamed(Routes.BUTTON_PAGES, arguments: int.parse(url));
    }
  }

  Future<List<ButtonPage>> getButtonPages(String id) async {
    
    Uri url = Uri.parse("${constants.BASE_URL_API}/api/button-pages/${id}");
    var res = await http.get(url);
    

    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];
    

    update();

    if(data == null || data.isEmpty){
      return [];
    }else{
      changeTitleAppBar(data.map((e) => ButtonPage.fromJson(e)).toList()[0].title);
      return data.map((e) => ButtonPage.fromJson(e)).toList();
    }

  }
}
