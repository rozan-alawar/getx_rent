import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_architecture/app/modules/category_details/controllers/category_details_controller.dart';
import 'package:project_architecture/app/modules/category_details/controllers/map_controller.dart';
import 'package:project_architecture/app/modules/newRent/category_model.dart';
import 'package:project_architecture/global_presntation/global_features/color_manager.dart';

import '../../../../global_presntation/global_widgets/primary_appbar.dart';
import '../../../../global_presntation/global_widgets/primary_text.dart';
import '../controllers/add_results_controller.dart';

class AddResultsView extends GetView<AddResultsController> {
  AddResultsView({Key? key}) : super(key: key);
  MapController c = Get.find<MapController>();
  CategoryDetailsController categoryController =
      Get.find<CategoryDetailsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PrimaryAppBar(text: 'addition_results'),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
            child: ListView.separated(
              shrinkWrap: T,
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemCount: categoryController.selectedCategories.length,
              itemBuilder: (context, index) {
                Category category =
                    categoryController.selectedCategories[index];
                return Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(25.r),
                  color: ColorManager.white,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryText(category.name,
                            color: ColorManager.textColor),
                        SizedBox(height: 12.h),
                        Divider(color: ColorManager.dividerColor),
                        SizedBox(height: 12.h),
                        Obx(
                          () => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r)),
                            height: 122.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: GoogleMap(
                                zoomControlsEnabled: false,
                                scrollGesturesEnabled: false,
                                mapType: MapType.normal,
                                initialCameraPosition: CameraPosition(
                                  target: c.selectedLocation.value,
                                  zoom: 15.0,
                                ),
                                markers: {
                                  Marker(
                                    markerId:
                                        const MarkerId('selected-location'),
                                    position: LatLng(
                                      c.selectedLocation.value.latitude,
                                      c.selectedLocation.value.longitude,
                                    ),
                                  ),
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/location.svg'),
                                    SizedBox(width: 5.w),
                                    PrimaryText(
                                      '${c.currentAddress} جدة - حي النهضة',
                                      color: ColorManager.hintTextColor,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/layer.svg'),
                                    SizedBox(width: 5.w),
                                    PrimaryText(
                                      categoryController.loungesType[
                                          categoryController.loungesTypeNo],
                                      color: ColorManager.hintTextColor,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/person.svg'),
                                    SizedBox(width: 5.w),
                                    PrimaryText(
                                      categoryController.reservedFor.last,
                                      color: ColorManager.hintTextColor,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/chair.svg'),
                                    SizedBox(width: 5.w),
                                    PrimaryText(
                                      '${categoryController.loungesNo} ${'lounge1'.tr}',
                                      color: ColorManager.hintTextColor,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/kitchen.svg'),
                                    SizedBox(width: 5.w),
                                    PrimaryText(
                                      'تتسع إلى 2',
                                      color: ColorManager.hintTextColor,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(flex: 1),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/location.svg'),
                                    SizedBox(width: 5.w),
                                    PrimaryText(
                                      '${c.currentAddress} جدة - حي النهضة',
                                      color: ColorManager.hintTextColor,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/layer.svg'),
                                    SizedBox(width: 5.w),
                                    PrimaryText(
                                      categoryController.loungesType[
                                          categoryController.loungesTypeNo],
                                      color: ColorManager.hintTextColor,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/person.svg'),
                                    SizedBox(width: 5.w),
                                    PrimaryText(
                                      categoryController.reservedFor.last,
                                      color: ColorManager.hintTextColor,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/chair.svg'),
                                    SizedBox(width: 5.w),
                                    PrimaryText(
                                      '${categoryController.loungesNo} ${'lounge1'.tr}',
                                      color: ColorManager.hintTextColor,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/kitchen.svg'),
                                    SizedBox(width: 5.w),
                                    PrimaryText(
                                      'تتسع إلى 2',
                                      color: ColorManager.hintTextColor,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(flex: 1)
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
