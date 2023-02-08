import 'package:get/get.dart';

import '../controllers/button_pages_controller.dart';

class ButtonPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ButtonPagesController>(
      () => ButtonPagesController(),
    );
  }
}
