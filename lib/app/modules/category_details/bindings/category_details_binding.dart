import 'package:get/get.dart';

import 'package:project_architecture/app/modules/category_details/controllers/map_controller.dart';

import '../controllers/category_details_controller.dart';

class CategoryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(
      () => MapController(),
    );
    Get.put<CategoryDetailsController>(
      CategoryDetailsController(),
      permanent: true,
    );
  }
}
