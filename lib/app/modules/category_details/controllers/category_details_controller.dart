// import 'package:geocoding/geocoding.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_architecture/app/modules/category_details/unit_model.dart';
import 'package:project_architecture/app/modules/newRent/controllers/new_rent_controller.dart';
import 'package:project_architecture/global_presntation/global_features/color_manager.dart';

import '../../add_results/views/add_results_view.dart';
import '../../newRent/category_model.dart';

class CategoryDetailsController extends GetxController {
  final selectedCategories = Get.find<NewRentController>().selectedCategories;
  final controller = Get.find<NewRentController>();
  final unitAreaController = TextEditingController();
  final seatsCapacityController = TextEditingController();
  final doubleBedsController = TextEditingController();
  final singleBedsController = TextEditingController();
  final sofaBedsController = TextEditingController();
  final tableSizeController = TextEditingController();
  final weekdaysPriceController = TextEditingController();

  RxInt currentCategoryIndex = 0.obs;
  var currentStep = 0.obs;
  int selected = 0;
  int loungesTypeNo = 0;
  Rx<Color> color = ColorManager.white.obs;
  RxInt loungesNo = 0.obs;
  RxList loungesList = [].obs;
  RxBool isIndoor = false.obs;
  RxBool isPrivate = false.obs;
  RxInt bedRoomNo = 0.obs;
  RxList bedroomList = [].obs;
  RxBool hasKitchen = false.obs;
  RxBool isPrivateKitchen = false.obs;

  Unit? unit;

  void nextCategory() {
    if (currentCategoryIndex.value > selectedCategories.length - 1) {
      Get.offAll(() => AddResultsView());
    } else {
      currentCategoryIndex.value++;
    }
  }

  final RxString direction = 'south'.tr.obs;
  List<String> directionsList = [
    'south'.tr,
    'east'.tr,
    'west'.tr,
    'north'.tr,
  ].obs;

  @override
  void onClose() {
    unitAreaController.clear();
    seatsCapacityController.clear();
    doubleBedsController.clear();
    singleBedsController.clear();
    sofaBedsController.clear();
    tableSizeController.clear();
    super.onClose();
  }

  void goToNextStep() {
    if (currentStep.value < 2) {
      currentStep.value++;
    }
  }

  updateColor(int index, List list, List colors) {
    for (var i = 0; i < list.length; i++) {
      if (i != index) {
        colors[i] = ColorManager.white;
      } else {
        colors[index] = ColorManager.secondary;
      }
    }
    controller.saveCategoriesList();
  }

  incrementLoungesNo() {
    loungesNo++;
    final lounges = Lounges(
      loungeType: loungesType[loungesTypeNo],
      numberOfSeats: int.tryParse(seatsCapacityController.text) ?? 0,
      isIndoor: isIndoor.value,
      isPrivate: isPrivate.value,
    );
    loungesList.add(lounges);
    controller.saveCategoriesList();
  }

  decrementLoungesNo() {
    if (loungesNo.value > 0) {
      loungesNo--;
      loungesList.removeLast();
    }
  }

  removeLounges(int index) {
    loungesList.removeAt(index);
    loungesNo--;
  }

  incrementbedroomNo() {
    bedRoomNo++;
    final lounges = Lounges(
      loungeType: loungesType[loungesTypeNo],
      numberOfSeats: int.tryParse(seatsCapacityController.text) ?? 0,
      isIndoor: isIndoor.value,
      isPrivate: isPrivate.value,
    );
    bedroomList.add(lounges);
  }

  decrementbedroomNo() {
    if (bedRoomNo.value > 0) {
      bedRoomNo--;
      bedroomList.removeLast();
    }
  }

  removebedroom(int index) {
    bedroomList.removeAt(index);
    bedRoomNo--;
  }

  void updateUnitArea(Category category, String value) {
    category.units.first.unitArea = value;
    controller.saveCategoriesList();
  }

  void updateUnitSeatCapacity(Category category, String value) {
    category.units.first.kitchen!.diningTableCapacity = value;
    controller.saveCategoriesList();
  }

  List<String> reservedFor = [
    'youth'.tr,
    'families'.tr,
    '${'youth'.tr} ${'and'.tr} ${'families'.tr}',
  ];

  final reversedColors = [
    ColorManager.white,
    ColorManager.white,
    ColorManager.white,
  ].obs;

  final loungesTypeColors = [
    ColorManager.white,
    ColorManager.white,
    ColorManager.white,
    ColorManager.white,
  ].obs;

  List<String> loungesType = [
    'lounge1'.tr,
    'lounge2'.tr,
    'living_room'.tr,
    'tent'.tr,
  ];
  List<String> loungesFacilities = [
    'air_conditioning'.tr,
    'heating'.tr,
    'spray_mister'.tr,
    'stove'.tr,
    'grill'.tr,
    'television'.tr,
    'video_games'.tr,
    'swing'.tr,
  ];

  List<String> bedroomFacilities = [
    'air_conditioning'.tr,
    'heating'.tr,
    'television'.tr,
    'master_bedroom'.tr,
    'jacuzzi'.tr,
    'bathtub'.tr,
    'desk'.tr,
    'lounge2'.tr,
  ];

  List<String> kitchenFacilities = [
    'refrigerator'.tr,
    'oven'.tr,
    'microwave'.tr,
    'kettle'.tr,
    'cooking_utensils'.tr,
  ];

  List<String> days = [
    'sunday'.tr,
    'monday'.tr,
    'tuesday'.tr,
    'wednesday'.tr,
    'thursday'.tr,
    'friday'.tr,
  ];
}
