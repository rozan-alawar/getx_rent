import 'package:get/get.dart';

import '../controllers/add_results_controller.dart';

class AddResultsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddResultsController>(
      () => AddResultsController(),
    );
  }
}
