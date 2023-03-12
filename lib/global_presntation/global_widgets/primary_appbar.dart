import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_text.dart';

import '../global_features/font_manager.dart';

class PrimaryAppBar extends StatelessWidget with PreferredSizeWidget {
  const PrimaryAppBar({
    super.key,
    required this.text,
    this.withLeading = true,
  });
  final String text;
  final bool withLeading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: withLeading
          ? Row(
              children: [
                InkWell(
                  child: Get.deviceLocale!.languageCode == 'ar'
                      ? SvgPicture.asset('assets/icons/arrow.svg')
                      : SvgPicture.asset('assets/icons/Arrow - Left.svg'),
                  onTap: () {
                    Get.back();
                  },
                ),
                PrimaryText(
                  text,
                  fontWeight: FontWeightManager.regular,
                  fontSize: 16,
                ),
              ],
            )
          : PrimaryText(
              text,
              fontWeight: FontWeightManager.regular,
              fontSize: 16,
            ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 60.h);
}
