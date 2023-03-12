import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_architecture/app/modules/category_details/controllers/map_controller.dart';
import 'package:project_architecture/global_presntation/global_features/color_manager.dart';
import 'package:project_architecture/global_presntation/global_features/font_manager.dart';
import 'package:project_architecture/global_presntation/global_widgets/Primary_loading.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';

class RealEstateSiteView extends GetView<MapController> {
  const RealEstateSiteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: controller.isLoading.value
              ? const LoadingIndiaor()
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryText(
                        'property_location',
                        color: ColorManager.primary,
                        fontWeight: FontWeightManager.bold,
                      ),
                      SizedBox(height: 12.h),
                      Divider(color: ColorManager.dividerColor),
                      SizedBox(height: 12.h),
                      PrimaryText(
                        'please_select_property_location_on_map',
                        color: ColorManager.hintTextColor,
                        fontSize: 12,
                      ),
                      SizedBox(height: 12.h),
                      Obx(() => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r)),
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: GoogleMap(
                                onTap: (argument) => controller.handleTap(),
                                mapType: MapType.normal,
                                initialCameraPosition: CameraPosition(
                                  target: controller.selectedLocation.value,
                                  zoom: 15.0,
                                ),
                                markers: {
                                  Marker(
                                    markerId:
                                        const MarkerId('selected-location'),
                                    position: LatLng(
                                        controller
                                            .selectedLocation.value.latitude,
                                        controller
                                            .selectedLocation.value.longitude),
                                  ),
                                },
                              ),
                            ),
                          )),
                      SizedBox(height: 16.h),
                      PrimaryText(
                        'selected_location',
                        color: ColorManager.textColor,
                        fontWeight: FontWeightManager.bold,
                        fontSize: 14,
                      ),
                      PrimaryText(
                        controller.currentAddress.value,
                        color: ColorManager.hintTextColor,
                        fontSize: 12,
                      ),
                      SizedBox(height: 28.h),
                      Divider(color: ColorManager.dividerColor),
                      SizedBox(height: 16.h),
                      Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const PrimaryText(
                                'show_exact_location_before_booking',
                                fontSize: 12,
                              ),
                              CupertinoSwitch(
                                value: controller.showLocation.value,
                                onChanged: (value) =>
                                    controller.saveLocation(value),
                              ),
                            ],
                          )),
                      SizedBox(height: 8.h),
                      PrimaryText(
                        'show_exact_location_on_map',
                        color: ColorManager.hintTextColor,
                        fontSize: 12,
                      )
                    ],
                  ),
                ),
        ));
  }
}
