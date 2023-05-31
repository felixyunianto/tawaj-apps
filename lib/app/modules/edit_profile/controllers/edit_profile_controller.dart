import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tawaj/app/data/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:tawaj/app/data/constants/constants.dart' as constants;
import 'package:tawaj/app/modules/layout/controllers/layout_controller.dart';
import 'package:tawaj/app/routes/app_pages.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController
  final _layoutController = Get.put(LayoutController());
  final getStorage = GetStorage();
  final namePerson  = "".obs;

  final loginFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final whatsappController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmationPasswordController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getProfile(getStorage.read('user')["id"].toString());
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  String getValue(String key) {
    if (getStorage.read("user") != null) {
      var value = getStorage.read("user")["id"];
      return value.toString();
    }
    return "";
  }

  void getProfile(String id) async {
    Uri uri = Uri.parse("${constants.BASE_URL_API}/api/profile/${id}");
    var res = await http.get(uri, headers: {
      "Authorization": getStorage.read('token') != null
          ? "Bearer ${getStorage.read('token')['token']}"
          : "",
      "Accept": "application/json"
    });
    if (_layoutController.tabIndex == 2) {
      if (res.statusCode == 401) {
        _layoutController.changeTabIndex(0);
        Get.offAllNamed(Routes.OPTION_SIGN);
        return null;
      } else {
        Map<String, dynamic> data =
            (json.decode(res.body) as Map<String, dynamic>)["data"];
        nameController.text = data['name'];
        emailController.text = data['email'];
        usernameController.text = data['username'];
        whatsappController.text = data['whatsapp'];
        namePerson.value = data['name'] ;
        update();
        
      }
    }
  }

  String? validator(String? value) {
    if (passwordController.text != confirmationPasswordController.text) {
      return "Password dan konfirmasi tidak sama";
    }
    return null;
  }

  void editProfile() {
    if (loginFormKey.currentState!.validate()) {
      var payload = {
        "name": nameController.text,
        "email": emailController.text,
        "username": usernameController.text,
        "whatsapp": whatsappController.text,
      };
      if (passwordController.text != "") {
        payload['password'] = passwordController.text;
      }
      postEditProfile(payload);
    }
  }

  void postEditProfile(Map<String, dynamic> payload) async {
    Uri uri = Uri.parse(
        "${constants.BASE_URL_API}/api/edit-profile/${getStorage.read('user')['id']}");

    var res = await http.post(uri,
        headers: {
          "Authorization": getStorage.read('token') != null
              ? "Bearer ${getStorage.read('token')['token']}"
              : "",
          "Accept": "application/json"
        },
        body: payload);
    var response = json.decode(res.body) as Map<String, dynamic>;

    if (res.statusCode == 200) {
      _layoutController.changeTabIndex(2);
      Get.offAllNamed(Routes.LAYOUT);
    } else {
      Get.snackbar("Error", "Gagal edit profile");
    }
  }
}
