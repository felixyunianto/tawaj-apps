import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tawaj/app/data/models/user.dart';
import 'package:tawaj/app/data/constants/constants.dart' as constants;
import 'package:http/http.dart' as http;
import 'package:tawaj/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final count = 0.obs;

  final getStorage = GetStorage();

  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isShowPassword = true.obs;

  void setIsShowPassword(bool status) {
    isShowPassword.value = status;
    update();
  }

  String? emailValidator(String? value) {
    return null;
  }

  String? validator(String? value) {
    if (value == "") {
      return 'Harus diisi';
    }

    return null;
  }

  void login() {
    if (loginFormKey.currentState!.validate()) {
      checkUser(emailController.text, passwordController.text).then((auth) {
        if (auth) {
          Get.offAllNamed(Routes.LAYOUT);
        } else {
          Get.snackbar('Login', 'Invalid email or password');
        }
        passwordController.clear();
      });
    }
  }

  Future<bool> checkUser(String email, String password) async {
    Uri url = Uri.parse("${constants.BASE_URL_API}/api/login");
    var res = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{"email": email, "password": password}));

    var response = json.decode(res.body) as Map<String, dynamic>;

    if (res.statusCode == 200) {
      var token = await FirebaseMessaging.instance.getToken();

      Map<String, dynamic> data =
          (json.decode(res.body) as Map<String, dynamic>)["data"];
      var user = data['user'];
      await saveToken(token, user['id'].toString());
      getStorage.write("user", data['user']);
      getStorage.write("token", data['token']);
      getStorage.write('isLogin', true);

      return true;
    }

    return false;
  }

  Future<bool> saveToken(String? token, String id) async {
    Uri url = Uri.parse("${constants.BASE_URL_API}/api/save-token/${id}");
    var res = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"token": token!}));

    var response = json.decode(res.body) as Map<String, dynamic>;

    return true;
  }

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
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
