import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tawaj/app/modules/button_pages/controllers/button_pages_controller.dart';
import 'package:tawaj/app/modules/home/controllers/home_controller.dart';

import 'app/routes/app_pages.dart';

void main(List<String> args) {
  Get.put(HomeController());
  Get.put(ButtonPagesController());
  runApp(GetMaterialApp(
    theme: ThemeData(fontFamily: "Open Sans", backgroundColor: Color(0xff0C3B2E)),
    debugShowCheckedModeBanner: false,
    // title: "Application",
    initialRoute: Routes.SPLACH_SCREEN,
    getPages: AppPages.routes,
  ));
}
