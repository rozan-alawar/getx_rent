import 'package:get/get.dart';

import '../controllers/new_rent_controller.dart';

class NewRentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NewRentController>(NewRentController(), permanent: true);
  }
}
