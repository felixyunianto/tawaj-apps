import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:tawaj/app/routes/app_pages.dart';

class LayoutController extends GetxController {
  final getStorage = GetStorage();
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    if(index == 2 && getStorage.read("token") == null){
      changeTabIndex(0);
      Get.offAllNamed(Routes.OPTION_SIGN);
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    changeTabIndex(0);
  }

  @override
  void onReady() {
    super.onReady();
    changeTabIndex(0);
  }

  @override
  void onClose() {
    super.onClose();
    
  }

  @override
  void dispose() {
    changeTabIndex(0);
  }
  
}
