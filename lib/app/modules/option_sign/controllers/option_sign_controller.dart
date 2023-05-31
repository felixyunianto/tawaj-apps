import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:tawaj/app/routes/app_pages.dart';

class OptionSignController extends GetxController {
  //TODO: Implement OptionSignController
  final getStorage = GetStorage();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if(getStorage.read("isLogin") !=null){
      Get.offAllNamed(Routes.LAYOUT);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

}
