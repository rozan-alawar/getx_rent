import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrimaryDropDownButton extends StatelessWidget {
  const PrimaryDropDownButton({
    super.key,
    this.value,
    this.onChanged,
    this.items,
  });

  final String? value;
  final void Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DropdownButtonFormField<String>(
        elevation: 8,
        alignment: Alignment.bottomCenter,
        borderRadius: BorderRadius.circular(20),
        icon: SvgPicture.asset('assets/icons/arrow-circle-down.svg'),
        value: value,
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
