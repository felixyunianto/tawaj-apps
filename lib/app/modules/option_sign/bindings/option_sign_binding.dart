import 'package:get/get.dart';

import '../controllers/option_sign_controller.dart';

class OptionSignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OptionSignController>(
      () => OptionSignController(),
    );
  }
}
