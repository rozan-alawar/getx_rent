import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_architecture/global_presntation/global_features/color_manager.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';

class PrimaryCard extends StatelessWidget {
  const PrimaryCard(
    this.text, {
    super.key,
    this.width = 75,
    this.height = 40,
    this.color,
    this.bgColor = Colors.white,
  });

  final double width;
  final double height;
  final String text;
  final Color? color;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: PrimaryText(
            text.tr,
            color: color,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PrimaryCard(text.tr),
        Positioned.directional(
          textDirection: Get.deviceLocale!.languageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          bottom: 33.h,
          start: 55.w,
          child: InkWell(
            onTap: onTap,
            child: CircleAvatar(
              radius: 8.r,
              backgroundColor: ColorManager.primary,
              child: Icon(
                Icons.close,
                size: 10,
                color: ColorManager.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
