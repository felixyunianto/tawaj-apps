import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:tawaj/app/modules/button_pages/controllers/button_pages_controller.dart';
import 'package:tawaj/app/modules/home/controllers/home_controller.dart';
import 'package:tawaj/app/modules/layout/controllers/layout_controller.dart';
import 'package:tawaj/app/modules/option_sign/bindings/option_sign_binding.dart';
import 'package:tawaj/app/modules/option_sign/controllers/option_sign_controller.dart';
import 'package:tawaj/app/modules/profile/controllers/profile_controller.dart';

import 'app/routes/app_pages.dart';

void main(List<String> args) async {
  Get.put(HomeController());
  Get.put(ButtonPagesController());
  Get.put(OptionSignController());
  Get.put(LayoutController());
  Get.put(ProfileController());

  await GetStorage.init();
  
  runApp(GetMaterialApp(
    initialBinding: OptionSignBinding(),
    theme: ThemeData(fontFamily: "Open Sans", backgroundColor: Color(0xff0C3B2E)),
    debugShowCheckedModeBanner: false,
    // title: "Application",
    initialRoute: Routes.OPTION_SIGN,
    getPages: AppPages.routes,
  ));
}
