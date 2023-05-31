import 'dart:convert';

import 'package:get/get.dart';
import 'package:tawaj/app/data/models/notification.dart';
import 'package:http/http.dart' as http;
import 'package:tawaj/app/data/constants/constants.dart' as constants;

class NotificationController extends GetxController {
  //TODO: Implement NotificationController

  final count = 0.obs;
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


  Future<List<NotificationModel>> getBigButton() async {
    Uri url = Uri.parse("${constants.BASE_URL_API}/api/notifications");
    var res = await http.get(url);

    List? data = (json.decode((res.body)) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => NotificationModel.fromJson(e)).toList();
    }
  }
}
