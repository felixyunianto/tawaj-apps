import 'dart:convert';

import 'package:get/get.dart';
import 'package:tawaj/app/data/models/Search.dart';
import 'package:tawaj/app/data/models/content.dart';
import 'package:tawaj/app/data/constants/constants.dart' as constants;
import 'package:http/http.dart' as http;

class SearchController extends GetxController {
  //TODO: Implement SearchController

  final count = 0.obs;

  final contents = [].obs;
  String search = "";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void doSearch(String searchString) async {
    search = searchString;
    Uri url = Uri.parse("${constants.BASE_URL_API}/api/search");

    var res = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'search': search,
        }));

    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];
    contents.assignAll(data!);
    
  }
}
