import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_architecture/app/modules/category_details/controllers/map_controller.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_button.dart';

import '../../../../../global_presntation/global_features/color_manager.dart';
import '../../../../../global_presntation/global_features/font_manager.dart';
import '../../../../../global_presntation/global_widgets/primary_text.dart';

class MapView extends GetView<MapController> {
  const MapView({
    super.key,
    required this.selectedLocation,
  });
  final LatLng selectedLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            GoogleMap(
              onMapCreated: controller.onMapCreated,
              onTap: (argument) => controller.onMapTapped(argument),
              initialCameraPosition: CameraPosition(
                target: selectedLocation,
                zoom: 15.0,
              ),
              zoomControlsEnabled: F,
              onCameraMove: (position) =>
                  controller.onMapTapped(position.target),
              markers: controller.markers!,
            ),
            Positioned.directional(
              textDirection: TextDirection.rtl,
              end: 20,
              top: 40,
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
            Positioned(
              bottom: 0,
              child: Container(
                height: 180.h,
                width: Get.width,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 100,
                      blurRadius: 100,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      child: ListTile(
                        minLeadingWidth: 20,
                        leading: SvgPicture.asset('assets/icons/map.svg'),
                        title: PrimaryText(
                          'selected_location',
                          color: ColorManager.textColor,
                          fontWeight: FontWeightManager.bold,
                          fontSize: 14,
                        ),
                        subtitle: PrimaryText(
                          controller.currentAddress.value,
                          color: ColorManager.hintTextColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    PrimaryButton(
                      text: 'save',
                      color: ColorManager.primary,
                      onPressed: () => Get.back(
                          result:
                              controller.tappedLocation ?? selectedLocation),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
