import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../global_features/font_manager.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;
  final bool lineThrow;
  final double height;

  const PrimaryText(this.text,
      {Key? key,
      this.fontSize = 16,
      this.color,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.start,
      this.overflow = TextOverflow.visible,
      this.maxLines = 5,
      this.lineThrow = false,
      this.height = 1.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        height: height,
        decoration:
            lineThrow ? TextDecoration.lineThrough : TextDecoration.none,
        fontFamily: Get.locale == const Locale('ar')
            ? FontConstants.arabicFontFamily
            : FontConstants.fontFamily,
      ),
    );
  }
}
