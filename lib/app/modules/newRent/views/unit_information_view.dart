import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_architecture/app/modules/newRent/category_model.dart';
import 'package:project_architecture/app/modules/newRent/controllers/new_rent_controller.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_textfiled.dart';
import '../../../../global_presntation/global_features/color_manager.dart';
import '../../../../global_presntation/global_features/font_manager.dart';
import '../../../../global_presntation/global_widgets/primary_appbar.dart';
import '../../../../global_presntation/global_widgets/primary_button.dart';
import '../../../../global_presntation/global_widgets/primary_numstepper.dart';
import '../../../../global_presntation/global_widgets/primary_text.dart';
import '../../../routes/app_pages.dart';

class UnitInformationView extends GetView<NewRentController> {
  const UnitInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(text: 'unit_information'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              PrimaryText(
                'categories',
                fontWeight: FontWeightManager.bold,
                color: ColorManager.textColor,
              ),
              SizedBox(height: 12.h),
              PrimaryText(
                'choose_unit_numbers_per_category',
                color: ColorManager.hintTextColor,
                fontSize: 14,
              ),
              SizedBox(height: 12.h),
              Divider(color: ColorManager.dividerColor),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.selectedCategories.length,
                itemBuilder: (context, index) {
                  Category category = controller.selectedCategories[index];
                  return GetBuilder<NewRentController>(
                    builder: (controller) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Material(
                        borderRadius: BorderRadius.circular(24.r),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionTile(
                            tilePadding: EdgeInsetsDirectional.only(start: 0.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            expandedCrossAxisAlignment:
                                CrossAxisAlignment.start,
                            title: PrimaryText(
                              category.name,
                              color: ColorManager.textColor,
                              fontWeight: FontWeightManager.regular,
                            ),
                            children: [
                              Divider(color: ColorManager.dividerColor),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  PrimaryText(
                                    'number_of_units',
                                    fontWeight: FontWeightManager.bold,
                                    color: ColorManager.textColor,
                                    fontSize: 12,
                                  ),
                                  Obx(
                                    () => NumStepper(
                                      color: ColorManager.white,
                                      text:
                                          '${controller.selectedCategories[index].unitNumber}',
                                      addButtonTap: () =>
                                          controller.incrementUnits(index),
                                      removeButtonTap: () =>
                                          controller.decrementUnits(index),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.h),
                              Divider(color: ColorManager.dividerColor),
                              SizedBox(height: 12.h),
                              category.units.isNotEmpty
                                  ? GridView.builder(
                                      itemCount: category.units.length,
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 2.5,
                                        crossAxisCount: 2,
                                      ),
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            PrimaryText(
                                              '${'unit_number'.tr} ${index + 1}',
                                              fontWeight:
                                                  FontWeightManager.bold,
                                              color: ColorManager.textColor,
                                              fontSize: 12,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                top: 15.h,
                                                start: 12.w,
                                              ),
                                              child: SizedBox(
                                                width: 70,
                                                height: 70,
                                                child: PrimaryTextField(
                                                  initialValue: category
                                                      .units[index].unitNo,
                                                  onChanged: (value) =>
                                                      controller.updateUnitNo(
                                                    category,
                                                    index,
                                                    value,
                                                  ),
                                                  validator: (value) {
                                                    return 'null';
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PrimaryButton(
        text: 'next',
        color: ColorManager.primary,
        onPressed: () {
          Get.bottomSheet(
            Container(
              color: ColorManager.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: InkWell(
                            onTap: () => Get.back(),
                            child: CircleAvatar(
                              radius: 15.r,
                              backgroundColor: ColorManager.primary,
                              child: Icon(
                                Icons.close,
                                size: 20,
                                color: ColorManager.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Divider(color: ColorManager.dividerColor),
                        SizedBox(height: 12.h),
                        PrimaryText(
                          'add_property_instructions',
                          color: ColorManager.textColor,
                          maxLines: 100,
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  PrimaryButton(
                    text: 'next',
                    color: ColorManager.primary,
                    onPressed: () {
                      controller.saveCategoriesList();
                      Get.offNamed(Routes.CATEGORY_DETAILS);
                    },
                  )
                ],
              ),
            ),
            isScrollControlled: true,
          );
        },
      ),
    );
  }
}
