import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_architecture/global_presntation/global_features/color_manager.dart';
import 'package:project_architecture/global_presntation/global_widgets/primary_small_card.dart';

class NumStepper extends StatelessWidget {
  const NumStepper({
    super.key,
    required this.color,
    required this.text,
    required this.addButtonTap,
    required this.removeButtonTap,
  });

  final Color color;
  final String text;
  final void Function() addButtonTap;
  final void Function() removeButtonTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleButton(color: color, icon: Icons.add, onTap: addButtonTap),
        SizedBox(width: 8.w),
        PrimaryCard(text),
        SizedBox(width: 8.w),
        CircleButton(color: color, icon: Icons.remove, onTap: removeButtonTap),
      ],
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  final Color color;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: color == ColorManager.white ? ColorManager.textColor : color,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            color: color == ColorManager.white
                ? ColorManager.textColor
                : ColorManager.white,
          ),
        ),
      ),
    );
  }
}
