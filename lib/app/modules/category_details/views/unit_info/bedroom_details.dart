import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:project_architecture/app/modules/category_details/controllers/category_details_controller.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_small_card.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_textfiled.dart';

import '../../../../../global_presntation/global_features/color_manager.dart';
import '../../../../../global_presntation/global_features/font_manager.dart';
import '../../../../../global_presntation/global_widgets/primary_text.dart';

class BedroomDetails extends StatelessWidget {
  const BedroomDetails({
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
        itemCount: controller.bedroomList.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryText(
                    '${'bedroom_number'.tr} ${index + 1}',
                    color: ColorManager.primary,
                    fontWeight: FontWeightManager.bold,
                    fontSize: 10,
                  ),
                  GestureDetector(
                    onTap: () => controller.removebedroom(index),
                    child: PrimaryText(
                      '${'delete'.tr} ${'bedroom'.tr}',
                      color: ColorManager.primary,
                      fontWeight: FontWeightManager.bold,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              BedDetails(
                text: 'double_beds_count',
                textFieldController: controller.doubleBedsController,
              ),
              BedDetails(
                text: 'single_beds_count',
                textFieldController: controller.singleBedsController,
              ),
              BedDetails(
                text: 'sofa_beds_count',
                textFieldController: controller.sofaBedsController,
              ),
              SizedBox(height: 8.h),
              PrimaryText(
                '${'facilities'.tr} ${'bedroom_number'.tr}  ${index + 1}',
                color: ColorManager.textColor,
                fontSize: 12,
                fontWeight: FontWeightManager.bold,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Wrap(
                  children: [
                    for (int i = 0;
                        i < controller.bedroomFacilities.length;
                        i++)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.only(end: 8.w, bottom: 8.h),
                        child: GestureDetector(
                          onTap: () {},
                          child: PrimaryCard(
                            controller.bedroomFacilities[i],
                            width: 96.w,
                          ),
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

class BedDetails extends StatelessWidget {
  const BedDetails({
    super.key,
    required this.text,
    required this.textFieldController,
  });

  final TextEditingController textFieldController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryText(
          text,
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
              height: 60,
              child: PrimaryTextField(
                controller: textFieldController,
                validator: (value) => '',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
