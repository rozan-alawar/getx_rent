import 'package:get/get.dart';

import '../modules/add_results/bindings/add_results_binding.dart';
import '../modules/add_results/views/add_results_view.dart';
import '../modules/category_details/bindings/category_details_binding.dart';
import '../modules/category_details/views/category_details_view.dart';
import '../modules/newRent/bindings/new_rent_binding.dart';
import '../modules/newRent/views/new_rent_view.dart';
import '../modules/newRent/views/unit_information_view.dart';
import '../modules/success/bindings/success_binding.dart';
import '../modules/success/views/success_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NEW_RENT;

  static final routes = [
    GetPage(
      name: _Paths.NEW_RENT,
      page: () => const NewRentView(),
      binding: NewRentBinding(),
    ),
    GetPage(
      name: _Paths.UNIT_INFORMATION,
      page: () => const UnitInformationView(),
    ),
    GetPage(
      name: _Paths.CATEGORY_DETAILS,
      page: () => CategoryDetailsView(),
      binding: CategoryDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS,
      page: () => SuccessView(),
      binding: SuccessBinding(),
    ),
    GetPage(
      name: _Paths.ADD_RESULTS,
      page: () => AddResultsView(),
      binding: AddResultsBinding(),
    ),
  ];
}
