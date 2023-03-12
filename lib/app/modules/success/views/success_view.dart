import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:project_architecture/app/modules/category_details/controllers/category_details_controller.dart';
import 'package:project_architecture/app/modules/category_details/views/category_details_view.dart';
import 'package:project_architecture/global_presntation/global_features/color_manager.dart';
import 'package:project_architecture/global_presntation/global_features/font_manager.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';

import '../../../../global_presntation/global_widgets/primary_button.dart';
import '../controllers/success_controller.dart';

class SuccessView extends GetView<SuccessController> {
  SuccessView({Key? key}) : super(key: key);
  final CategoryDetailsController c = Get.find<CategoryDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/success icon component.svg'),
              SizedBox(height: 16.h),
              PrimaryText(
                '${'added_details_first_category'.tr} (${'category'.tr} ${c.currentCategoryIndex.value + 1} ${'from'.tr} ${c.selectedCategories.length})  ${c.selectedCategories[(c.currentCategoryIndex.value)].name}',
                color: ColorManager.textColor,
                fontWeight: FontWeightManager.bold,
                fontSize: 18,
              ),
              SizedBox(height: 12.h),
              PrimaryText(
                c.currentCategoryIndex.value == c.selectedCategories.length - 1
                    ? 'all_categories_details_added_successfully'
                    : 'first_category_details_added_successfully'.trParams({
                        'num1': controller
                            .currentCategory(c.currentCategoryIndex.value + 1),
                        'num2': controller
                            .currentCategory(c.currentCategoryIndex.value + 2)
                      }),
                textAlign: TextAlign.center,
                color: ColorManager.hintTextColor,
                fontSize: 14,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PrimaryButton(
        onPressed: () {
          c.nextCategory();
          if (c.currentCategoryIndex.value <= c.selectedCategories.length - 1) {
            Get.to(() => CategoryDetailsView());
          }
        },
        color: ColorManager.primary,
        text: 'next',
      ),
    );
  }
}
