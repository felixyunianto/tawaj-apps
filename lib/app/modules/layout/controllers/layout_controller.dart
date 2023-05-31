import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:tawaj/app/routes/app_pages.dart';
import 'package:tawaj/main.dart';

class LayoutController extends GetxController {
  final getStorage = GetStorage();
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    if (index == 2 && getStorage.read("token") == null) {
      changeTabIndex(0);
      Get.offAllNamed(Routes.OPTION_SIGN);
    }
    update();
  }

  @override
  void onInit() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
                    channel!.id, channel!.name, channel!.description,
                    icon: 'launch_background',)));
      }
    });

    // FirebaseMessaging.instance.getToken().then((value) => print("token ${value}"));

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was publisherd!');
    });

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
