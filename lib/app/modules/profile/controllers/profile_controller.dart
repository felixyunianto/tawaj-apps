import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:tawaj/app/data/models/user.dart';
import 'package:tawaj/app/modules/layout/controllers/layout_controller.dart';
import 'package:tawaj/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:tawaj/app/data/constants/constants.dart' as constants;

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final _layoutController = Get.put(LayoutController());
  final getStorage = GetStorage();

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

  bool CheckProfile() {
    if (getStorage.read("user") != null) {
      return true;
    } else {
      return false;
    }
  }

  String getValue(String key) {
    if (getStorage.read("user") != null) {
      var value = getStorage.read("user")["id"];
      return value.toString();
    }
    return "";
  }

  // String getProfile(String key) {
  // if(getStorage.read("user") != null){
  //   return getStorage.read("user")[key];
  // }
  // return "";
  // }

  void signOut() async {
    Uri uri = Uri.parse("${constants.BASE_URL_API}/api/logout");
    var res = await http.post(uri, headers: {
      "Authorization": getStorage.read('token') != null
          ? "Bearer ${getStorage.read('token')['token']}"
          : "",
      "Accept": "application/json"
    });
    print(res.statusCode);

    if (res.statusCode == 200) {
      Get.offAllNamed(Routes.OPTION_SIGN);
      update();
      _layoutController.changeTabIndex(0);
      getStorage.write("isLogin", false);
    }
  }

  Future<User?> getProfile(String id) async {
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
        update();

        return User.fromJson(data);
      }
    }
  }
}
