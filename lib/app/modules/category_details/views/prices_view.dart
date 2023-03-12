import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:project_architecture/app/modules/category_details/controllers/category_details_controller.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_textfiled.dart';

import '../../../../../global_presntation/global_features/color_manager.dart';
import '../../../../../global_presntation/global_features/font_manager.dart';
import '../../../../../global_presntation/global_widgets/primary_text.dart';
import '../../../../global_presntation/global_widgets/primary_small_card.dart';

class PricesView extends GetView<CategoryDetailsController> {
  const PricesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
            'prices',
            color: ColorManager.primary,
            fontWeight: FontWeightManager.bold,
          ),
          SizedBox(height: 12.h),
          Divider(color: ColorManager.dividerColor),
          SizedBox(height: 12.h),
          PrimaryText(
            'select_weekdays',
            color: ColorManager.textColor,
            fontSize: 14,
            fontWeight: FontWeightManager.bold,
          ),
          SizedBox(height: 12.h),
          FittedBox(
            child: Row(
              children: [
                for (int i = 0; i < controller.days.length; i++)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: PrimaryCard(
                        controller.days[i],
                        width: 60,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          PrimaryText(
            'weekday_price',
            color: ColorManager.textColor,
            fontSize: 14,
            fontWeight: FontWeightManager.bold,
          ),
          SizedBox(height: 12.h),
          PrimaryTextField(
            controller: controller.weekdaysPriceController,
            validator: (value) => '',
            suffixIcon: Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Text('/${'night'.tr}'),
            ),
          ),
          Divider(color: ColorManager.dividerColor),
          SizedBox(height: 12.h),
          PrimaryText(
            'select_weekend_days',
            color: ColorManager.textColor,
            fontSize: 14,
            fontWeight: FontWeightManager.bold,
          ),
          SizedBox(height: 12.h),
          FittedBox(
            child: Row(
              children: [
                for (int i = 0; i < controller.days.length; i++)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: PrimaryCard(
                        controller.days[i],
                        width: 60,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          PrimaryText(
            'weekend_prices',
            color: ColorManager.textColor,
            fontSize: 14,
            fontWeight: FontWeightManager.bold,
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              PrimaryText(
                'thursday',
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
                    width: 90.w,
                    child: PrimaryTextField(
                      controller: controller.weekdaysPriceController,
                      validator: (value) => '',
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Text('currency'.tr),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              PrimaryText(
                'friday',
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
                    width: 90.w,
                    child: PrimaryTextField(
                      controller: controller.weekdaysPriceController,
                      validator: (value) => '',
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Text('currency'.tr),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
