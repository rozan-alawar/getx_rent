// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_architecture/app/modules/newRent/category_model.dart';
import 'package:project_architecture/core/cache_helper.dart';

import '../../../../API/custom_snack_bar.dart';
import '../../category_details/unit_model.dart';

class NewRentController extends GetxController {
  late TextEditingController arabicNameController;
  late TextEditingController englishNameController;

  RxString icon = 'assets/icons/add-circle.svg'.obs;

  List<String> categories = ['standard'.tr, 'deluxe'.tr, 'premier'.tr].obs;
  RxList selectedCategories = <Category>[].obs;

  addCategory(Category category) {
    final existingCategory = selectedCategories.firstWhereOrNull(
        (item) => item.name.toLowerCase() == category.name.toLowerCase());
    if (existingCategory == null) {
      selectedCategories.add(category);
      saveCategoriesList();
      arabicNameController.clear();
      englishNameController.clear();
    } else {
      CustomSnackBar.showCustomErrorSnackBar(
          title: 'already_added'.tr, message: 'category_already_added'.tr);
    }
  }

  deleteCategory(int index) {
    selectedCategories.removeAt(index);
    saveCategoriesList();
  }

  incrementUnits(int index) {
    Category category = selectedCategories[index];
    category.unitNumber++;
    final newUnit = Unit(kitchen: Kitchen());
    category.units.add(newUnit);
    saveCategoriesList();
    update();
  }

  void updateUnitNo(Category category, int index, String value) {
    category.units[index].unitNo = value;
  }

  decrementUnits(int index) {
    Category category = selectedCategories[index];
    if (category.unitNumber > 0) {
      category.unitNumber--;
      category.units.removeLast();
      saveCategoriesList();
      update();
    }
  }

  onChangeExspanssion(bool value) {
    value
        ? icon.value = 'assets/icons/remove-circle.svg'
        : icon.value = 'assets/icons/add-circle.svg';
  }

  @override
  void onInit() {
    super.onInit();
    arabicNameController = TextEditingController();
    englishNameController = TextEditingController();
    loadCategoryList();
  }

  @override
  void onClose() {
    arabicNameController.clear();
    englishNameController.clear();
    super.onClose();
  }

//save Selected categories to local storage
  saveCategoriesList() {
    CacheHelper.saveData(
      key: 'categories',
      value: json.encode(
        selectedCategories.toList(),
      ),
    );
  }

  loadCategoryList() {
    final categoryListJson = CacheHelper.getData(key: 'categories');

    if (categoryListJson != null) {
      final categoryListData = json.decode(categoryListJson);
      selectedCategories.value = (categoryListData as List)
          .map((categoryData) => Category(
                name: categoryData['name'],
                unitNumber: categoryData['unitNumber'],
                units: (categoryData['units'] as List)
                    .map(
                      (unitData) => Unit(
                        unitArea: unitData['unitArea'],
                        unitNo: unitData['unitNo'],
                        unitDirection: unitData['unitDirection'],
                        isReservedForYouth: unitData['isReservedForYouth'],
                        isReservedForFamilies:
                            unitData['isReservedForFamilies'],
                        numberOfBedrooms: unitData['numberOfBedrooms'],
                        numberOfLounges: unitData['numberOfLounges'],
                      ),
                    )
                    .toList(),
              ))
          .toList();
    }
  }
}
