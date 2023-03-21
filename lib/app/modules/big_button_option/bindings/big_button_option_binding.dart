import 'package:get/get.dart';

import '../controllers/big_button_option_controller.dart';

class BigButtonOptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BigButtonOptionController>(
      () => BigButtonOptionController(),
    );
  }
}
