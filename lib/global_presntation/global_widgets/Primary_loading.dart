import 'package:flutter/material.dart';
import 'package:project_architecture/global_presntation/global_features/color_manager.dart';

class LoadingIndiaor extends StatelessWidget {
  const LoadingIndiaor({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ColorManager.primary,
      ),
    );
  }
}
