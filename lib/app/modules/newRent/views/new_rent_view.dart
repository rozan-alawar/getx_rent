import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:project_architecture/app/modules/newRent/category_model.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_appbar.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_dropdown.dart';

import '../../../../API/custom_snack_bar.dart';
import '../../../../global_presntation/global_features/color_manager.dart';
import '../../../../global_presntation/global_features/font_manager.dart';
import '../../../../global_presntation/global_widgets/primary_button.dart';
import '../../../../global_presntation/global_widgets/primary_small_card.dart';
import '../../../../global_presntation/global_widgets/primary_text.dart';
import '../../../../global_presntation/global_widgets/primary_textfiled.dart';
import '../../../routes/app_pages.dart';
import '../../category_details/unit_model.dart';
import '../controllers/new_rent_controller.dart';

class NewRentView extends GetView<NewRentController> {
  const NewRentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        text: 'select_available_categories_in_your_property',
        withLeading: false,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              PrimaryText(
                'select_or_add_categories_in_your_property',
                color: ColorManager.hintTextColor,
                fontSize: 14,
              ),
              SizedBox(height: 12.h),
              Obx(
                () => PrimaryDropDownButton(
                  items: controller.categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  value: 'standard'.tr,
                  onChanged: (value) {
                    final category =
                        Category(name: value!, units: <Unit>[], unitNumber: 0);
                    controller.addCategory(category);
                  },
                ),
              ),
              Obx(() => controller.selectedCategories.isEmpty
                  ? const SizedBox()
                  : Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: PrimaryText(
                        'selected_categories',
                        color: ColorManager.textColor,
                        fontWeight: FontWeightManager.bold,
                      ),
                    )),
              SizedBox(height: 12.h),
              Obx(
                () => SizedBox(
                  height: controller.selectedCategories.isEmpty ? 0 : 50,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(width: 12.w),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.selectedCategories.length,
                    itemBuilder: (context, index) {
                      Category category = controller.selectedCategories[index];
                      return CategoriesCard(
                        text: category.name,
                        onTap: () => controller.deleteCategory(index),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              ExpansionTile(
                tilePadding: EdgeInsetsDirectional.only(start: 0.w),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                onExpansionChanged: (value) =>
                    controller.onChangeExspanssion(value),
                trailing: const SizedBox(),
                title: Row(
                  children: [
                    Obx(
                      () => SvgPicture.asset(
                        controller.icon.value,
                        width: 18.w,
                        height: 18.h,
                      ),
                    ),
                    SizedBox(width: 12.h),
                    const PrimaryText('add_custom_category'),
                  ],
                ),
                children: [
                  Divider(color: ColorManager.dividerColor),
                  SizedBox(height: 20.h),
                  PrimaryText(
                    'category_name_arabic',
                    fontWeight: FontWeightManager.bold,
                    color: ColorManager.textColor,
                  ),
                  SizedBox(height: 12.h),
                  PrimaryTextField(
                    hintText: '',
                    controller: controller.arabicNameController,
                    validator: (value) {
                      return 'null';
                    },
                  ),
                  SizedBox(height: 12.h),
                  PrimaryText(
                    'category_name_english',
                    fontWeight: FontWeightManager.bold,
                    color: ColorManager.textColor,
                  ),
                  SizedBox(height: 12.h),
                  PrimaryTextField(
                    hintText: '',
                    controller: controller.englishNameController,
                    validator: (value) {
                      return 'null';
                    },
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorManager.textColor,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: InkWell(
                      onTap: () => controller.addCategory(
                        Category(
                          name: controller.arabicNameController.text,
                          units: <Unit>[],
                          unitNumber: 0,
                        ),
                      ),
                      child: PrimaryCard('add', color: ColorManager.textColor),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PrimaryButton(
        text: 'next',
        color: ColorManager.primary,
        onPressed: () {
          controller.selectedCategories.isEmpty
              ? CustomSnackBar.showCustomErrorSnackBar(
                  title: 'error'.tr, message: 'choose_or_add_category'.tr)
              : Get.toNamed(Routes.UNIT_INFORMATION);
        },
      ),
    );
  }
}
