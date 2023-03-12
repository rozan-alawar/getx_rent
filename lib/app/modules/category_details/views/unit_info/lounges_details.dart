import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:project_architecture/app/modules/category_details/controllers/category_details_controller.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_small_card.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_textfiled.dart';

import '../../../../../global_presntation/global_features/color_manager.dart';
import '../../../../../global_presntation/global_features/font_manager.dart';
import '../../../../../global_presntation/global_widgets/primary_text.dart';

class LoungesDetails extends StatelessWidget {
  const LoungesDetails({
    super.key,
    required this.controller,
  });

  final CategoryDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Divider(color: ColorManager.dividerColor),
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.loungesList.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryText(
                    '${'lounge_number'.tr} ${index + 1}',
                    color: ColorManager.primary,
                    fontWeight: FontWeightManager.bold,
                    fontSize: 10,
                  ),
                  GestureDetector(
                    onTap: () => controller.removeLounges(index),
                    child: PrimaryText(
                      'delete_lounges',
                      color: ColorManager.primary,
                      fontWeight: FontWeightManager.bold,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              PrimaryText(
                '${'type'.tr} ${'lounge'.tr}',
                color: ColorManager.textColor,
                fontSize: 12,
                fontWeight: FontWeightManager.bold,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  children: [
                    for (int i = 0; i < controller.loungesType.length; i++)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            controller.loungesTypeNo = i;
                            controller.updateColor(
                              i,
                              controller.loungesType,
                              controller.loungesTypeColors,
                            );
                          },
                          child: Obx(
                            () => PrimaryCard(
                              bgColor: controller.loungesTypeColors[i],
                              controller.loungesType[i],
                              width: controller.loungesType[i]
                                      .contains('living_room'.tr)
                                  ? 90
                                  : 58,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              PrimaryText(
                '${'private'.tr} ${'or'.tr} ${'shared'.tr}',
                color: ColorManager.textColor,
                fontSize: 12,
                fontWeight: FontWeightManager.bold,
              ),
              Obx(() => Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => controller.isPrivate.value = true,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: controller.isPrivate.value == true
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
                          onTap: () => controller.isPrivate.value = false,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: controller.isPrivate.value == false
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
                  )),
              SizedBox(height: 12.h),
              PrimaryText(
                '${'indoor'.tr} ${'or'.tr} ${'outdoor'.tr}',
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
                        onTap: () => controller.isIndoor.value = true,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: controller.isIndoor.value == true
                                  ? ColorManager.primary
                                  : ColorManager.white,
                            ),
                          ),
                          child: PrimaryCard(
                            'indoor',
                            width: 150.w,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller.isIndoor.value = false,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: controller.isIndoor.value == false
                                  ? ColorManager.primary
                                  : ColorManager.white,
                            ),
                          ),
                          child: PrimaryCard(
                            'outdoor',
                            width: 150.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  PrimaryText(
                    'seats_capacity',
                    color: ColorManager.textColor,
                    fontSize: 12,
                    fontWeight: FontWeightManager.bold,
                  ),
                  SizedBox(width: 12.h),
                  Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 70.w,
                        child: PrimaryTextField(
                          controller: controller.seatsCapacityController,
                          validator: (value) => '',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              PrimaryText(
                '${'facilities'.tr} ${'lounge'.tr}',
                color: ColorManager.textColor,
                fontSize: 12,
                fontWeight: FontWeightManager.bold,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Wrap(
                  children: [
                    for (int i = 0;
                        i < controller.loungesFacilities.length;
                        i++)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.only(end: 8.w, bottom: 8.h),
                        child: GestureDetector(
                          onTap: () {},
                          child: PrimaryCard(controller.loungesFacilities[i],
                              width: 96.w),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
