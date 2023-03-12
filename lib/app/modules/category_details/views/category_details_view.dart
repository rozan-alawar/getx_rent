import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:project_architecture/app/modules/category_details/views/prices_view.dart';
import 'package:project_architecture/app/modules/category_details/views/location/location_view.dart';
import 'package:project_architecture/app/modules/category_details/views/unit_info/unit_info_view.dart';
import 'package:project_architecture/app/modules/newRent/controllers/new_rent_controller.dart';
import 'package:project_architecture/app/routes/app_pages.dart';
import 'package:project_architecture/global_presntation/global_features/color_manager.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_appbar.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';

import '../../../../global_presntation/global_widgets/primary_button.dart';
import '../controllers/category_details_controller.dart';

class CategoryDetailsView extends GetView<CategoryDetailsController> {
  CategoryDetailsView({Key? key}) : super(key: key);

  NewRentController c = Get.find<NewRentController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: PrimaryAppBar(
          text:
              '(${'category'.tr} ${controller.currentCategoryIndex.value + 1} ${'from'.tr} ${controller.selectedCategories.length})  ${controller.selectedCategories[(controller.currentCategoryIndex.value)].name}',
        ),
        body: Obx(
          () => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                children: [
                  AnotherStepper(
                    iconHeight: 32.h,
                    iconWidth: 32.h,
                    stepperList: [
                      for (int i = 1; i <= 3; i++)
                        StepperData(
                          iconWidget: Material(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(50),
                            elevation: 5,
                            child: CircleAvatar(
                              backgroundColor:
                                  controller.currentStep.value >= i - 1
                                      ? ColorManager.primary
                                      : Colors.white,
                              child: Center(
                                child: PrimaryText(
                                  '$i',
                                  color: controller.currentStep.value < i - 1
                                      ? Colors.grey[600]
                                      : Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                    stepperDirection: Axis.horizontal,
                    barThickness: 2,
                    activeBarColor: ColorManager.primary,
                    inActiveBarColor: Colors.grey,
                    inverted: true,
                    activeIndex: controller.currentStep.value,
                  ),
                  controller.currentStep.value == 0
                      ? const RealEstateSiteView()
                      : controller.currentStep.value == 1
                          ? const UnitInfoView()
                          : const PricesView()
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: PrimaryButton(
          onPressed: () {
            c.saveCategoriesList();
            if (controller.currentStep.value == 2) {
              Get.toNamed(Routes.SUCCESS);
              controller.currentStep.value = 0;
            } else {
              controller.goToNextStep();
            }
          },
          color: ColorManager.primary,
          text: 'next',
        ),
      ),
    );
  }
}
