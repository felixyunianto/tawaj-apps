import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tawaj/app/data/models/button_page.dart';

class ButtonPagesController extends GetxController {
  var title = "".obs;

  void changeTitleAppBar(String text) {
    title.value = text;
  }

  Future<List<ButtonPage>> getButtonPages(String id) async {
    
    Uri url = Uri.parse("http://localhost:8000/api/button-pages/${id}");
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
