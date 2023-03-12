import 'package:get/get.dart';

class SuccessController extends GetxController {
  currentCategory(int index) {
    final Map<int, String> ordinals = {
      1: 'first'.tr,
      2: 'second'.tr,
      3: 'third'.tr,
      4: 'fourth'.tr,
      5: 'fifth'.tr,
      6: 'sixth'.tr,
      7: 'seventh'.tr,
      8: 'eighth'.tr,
      9: 'ninth'.tr,
      10: 'tenth'.tr,
    };
    return ordinals[index];
  }

  final count = 0.obs;

  void increment() => count.value++;
}
