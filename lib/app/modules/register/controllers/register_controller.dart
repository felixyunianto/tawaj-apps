import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawaj/app/data/constants/constants.dart' as constants;
import 'package:http/http.dart' as http;
import 'package:tawaj/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  final count = 0.obs;
  final List<String> list = <String>[
    'Bapak',
    'Ibu',
    'Kak',
    'Akhi',
    'Ukhti',
    'Mas',
    'Mbak',
    'Ustadz',
    'Ustadzah'
  ];

  var isShowPassword = true.obs;

  final dropdownState = GlobalKey<FormFieldState>();

  final registerFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final whatsappController = TextEditingController();
  final passwordController = TextEditingController();

  String? nickNameValue = "";

  void setIsShowPassword(bool status) {
    isShowPassword.value = status;
    update();
  }

  void onChangeNickname(String? value) {
    nickNameValue = value;
  }

  String? emailValidator(String? value) {
    var validEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!);
    if (value == "") {
      return "Harus diisi";
    }

    if (!validEmail) {
      return "Format email salah";
    }

    return null;
  }

  String? validator(String? value) {
    if (value == "") {
      return 'Harus diisi';
    }

    return null;
  }

  String? validatorNickname(Object? value) {
    if (value == null) {
      return "Harus diisi";
    }

    return null;
  }

  void register() {
    if (registerFormKey.currentState!.validate()) {
      doRegister().then((user) {
        if (user) {
          Get.snackbar("Register", "Register berhasil");
          Timer(Duration(seconds: 3), () {
            Get.offAllNamed(Routes.LOGIN);
          });
        } else {
          Get.snackbar("Register", "Gagal berhasil");
        }
      });
    }
  }

  Future<bool> doRegister() async {
    Uri url = Uri.parse("${constants.BASE_URL_API}/api/register");
    var res = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': usernameController.text,
          'email': emailController.text,
          'name': nameController.text,
          'password': passwordController.text,
          'nickname': nickNameValue!,
          'whatsapp': whatsappController.text
        }));

    var response = json.decode(res.body) as Map<String, dynamic>;

    if (res.statusCode == 200) {
      Map<String, dynamic> data =
          (json.decode(res.body) as Map<String, dynamic>)["data"];
      return true;
    }
    return false;
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
    super.onClose();
  }

  void increment() => count.value++;
}
