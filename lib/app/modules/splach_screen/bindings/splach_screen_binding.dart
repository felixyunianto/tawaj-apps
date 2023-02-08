import 'package:get/get.dart';

import '../controllers/splach_screen_controller.dart';

class SplachScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplachScreenController>(
      () => SplachScreenController(),
    );
  }
}
