import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:project_architecture/app/modules/category_details/controllers/category_details_controller.dart';
import 'package:project_architecture/app/modules/category_details/views/unit_info/bedroom_details.dart';
import 'package:project_architecture/app/modules/newRent/category_model.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_numstepper.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_small_card.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_textfiled.dart';

import '../../../../../global_presntation/global_features/color_manager.dart';
import '../../../../../global_presntation/global_features/font_manager.dart';
import '../../../../../global_presntation/global_widgets/Primary_dropdown.dart';
import '../../../../../global_presntation/global_widgets/primary_text.dart';
import 'lounges_details.dart';

class UnitInfoView extends GetView<CategoryDetailsController> {
  const UnitInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Category category =
        controller.selectedCategories[controller.currentCategoryIndex.value];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
            'unit_details',
            color: ColorManager.primary,
            fontWeight: FontWeightManager.bold,
          ),
          SizedBox(height: 12.h),
          Divider(color: ColorManager.dividerColor),
          SizedBox(height: 12.h),
          PrimaryText(
            'unit_area',
            color: ColorManager.textColor,
            fontSize: 14,
            fontWeight: FontWeightManager.bold,
          ),
          SizedBox(height: 12.h),
          PrimaryTextField(
            initialValue: category.units.first.unitArea,
            onChanged: (value) => controller.updateUnitArea(category, value),
            validator: (value) => '',
          ),
          PrimaryText(
            'direction',
            color: ColorManager.textColor,
            fontSize: 14,
            fontWeight: FontWeightManager.bold,
          ),
          SizedBox(height: 12.h),
          PrimaryDropDownButton(
            items: controller.directionsList.map((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: PrimaryText(
                  value,
                  color: ColorManager.hintTextColor,
                  fontSize: 14,
                ),
              );
            }).toList(),
            value: controller.direction.value,
            onChanged: (value) => category.units.first.unitDirection = value!,
          ),
          SizedBox(height: 16.h),
          PrimaryText(
            '${'youth'.tr} ${'or'.tr} ${'families'.tr}',
            color: ColorManager.textColor,
            fontSize: 14,
            fontWeight: FontWeightManager.bold,
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              for (int i = 0; i < controller.reservedFor.length; i++)
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      category.units.first.isReservedForFamilies =
                          i == 1 || i == 2;
                      category.units.first.isReservedForYouth =
                          i == 0 || i == 2;
                      controller.updateColor(
                          i, controller.reservedFor, controller.reversedColors);
                      controller.selected = i;
                    },
                    child: Obx(
                      () => PrimaryCard(
                        bgColor: controller.reversedColors[i],
                        controller.reservedFor[i],
                        width: controller.reservedFor[i].contains('and'.tr)
                            ? 150
                            : 75,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 16.h),
          PrimaryText(
            'choose_youth_and_families',
            color: ColorManager.hintTextColor,
            fontSize: 12,
          ),
          SizedBox(height: 24.h),
          Divider(color: ColorManager.dividerColor),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryText(
                'number_of_lounges',
                color: ColorManager.textColor,
                fontSize: 14,
                fontWeight: FontWeightManager.bold,
              ),
              Obx(
                () => NumStepper(
                  color: ColorManager.primary,
                  text: '${controller.loungesNo}',
                  addButtonTap: () => controller.incrementLoungesNo(),
                  removeButtonTap: () => controller.decrementLoungesNo(),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          LoungesDetails(controller: controller),
          SizedBox(height: 24.h),
          Divider(color: ColorManager.dividerColor),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryText(
                'bedrooms_count',
                color: ColorManager.textColor,
                fontSize: 14,
                fontWeight: FontWeightManager.bold,
              ),
              Obx(
                () => NumStepper(
                  color: ColorManager.primary,
                  text: '${controller.bedRoomNo}',
                  addButtonTap: () => controller.incrementbedroomNo(),
                  removeButtonTap: () => controller.decrementbedroomNo(),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          BedroomDetails(controller: controller),
          SizedBox(height: 24.h),
          Divider(color: ColorManager.dividerColor),
          SizedBox(height: 16.h),
          PrimaryText(
            'has_kitchen',
            color: ColorManager.textColor,
            fontSize: 14,
            fontWeight: FontWeightManager.bold,
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => controller.hasKitchen.value = true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: controller.hasKitchen.value == true
                              ? ColorManager.primary
                              : ColorManager.white,
                        ),
                      ),
                      child: PrimaryCard(
                        'yes',
                        width: 150.w,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.hasKitchen.value = false,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: controller.hasKitchen.value == false
                              ? ColorManager.primary
                              : ColorManager.white,
                        ),
                      ),
                      child: PrimaryCard(
                        'no',
                        width: 150.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          PrimaryText(
            '${'private'.tr} ${'or'.tr} ${'shared'.tr}',
            color: ColorManager.textColor,
            fontSize: 12,
            fontWeight: FontWeightManager.bold,
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => controller.isPrivateKitchen.value = true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: controller.isPrivateKitchen.value == true
                              ? ColorManager.primary
                              : ColorManager.white,
                        ),
                      ),
                      child: PrimaryCard(
                        'private',
                        width: 150.w,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.isPrivateKitchen.value = false,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: controller.isPrivateKitchen.value == false
                              ? ColorManager.primary
                              : ColorManager.white,
                        ),
                      ),
                      child: PrimaryCard(
                        'shared',
                        width: 150.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8.h),
          PrimaryText(
            'dining_table_size',
            color: ColorManager.textColor,
            fontSize: 14,
            fontWeight: FontWeightManager.bold,
          ),
          SizedBox(height: 12.h),
          PrimaryTextField(
            initialValue:
                category.units.first.kitchen?.diningTableCapacity ?? '',
            onChanged: (value) =>
                controller.updateUnitSeatCapacity(category, value),
            validator: (value) => '',
          ),
          PrimaryText(
            'kitchen_facilities',
            color: ColorManager.textColor,
            fontSize: 12,
            fontWeight: FontWeightManager.bold,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Wrap(
              children: [
                for (int i = 0; i < controller.kitchenFacilities.length; i++)
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 8.w, bottom: 8.h),
                    child: GestureDetector(
                      onTap: () {},
                      child: PrimaryCard(
                        controller.kitchenFacilities[i],
                        width: 96.w,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
