import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tawaj/app/modules/button_pages/controllers/button_pages_controller.dart';
import 'package:tawaj/app/modules/home/controllers/home_controller.dart';
import 'package:tawaj/app/modules/layout/controllers/layout_controller.dart';
import 'package:tawaj/app/modules/option_sign/bindings/option_sign_binding.dart';
import 'package:tawaj/app/modules/option_sign/controllers/option_sign_controller.dart';
import 'package:tawaj/app/modules/profile/controllers/profile_controller.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Hanlding a background message ${message.messageId}");
}

AndroidNotificationChannel? channel;

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
        'high_importance_channel',
        'High Importance Notifications',
        'This channel is used for important notifications',
        importance: Importance.high);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
  }

  Get.put(HomeController());
  Get.put(ButtonPagesController());
  Get.put(OptionSignController());
  Get.put(LayoutController());
  Get.put(ProfileController());

  await GetStorage.init();

  runApp(GetMaterialApp(
    initialBinding: OptionSignBinding(),
    theme:
        ThemeData(fontFamily: "Open Sans", backgroundColor: Color(0xff0C3B2E)),
    debugShowCheckedModeBanner: false,
    // title: "Application",
    initialRoute: Routes.OPTION_SIGN,
    getPages: AppPages.routes,
  ));
}
