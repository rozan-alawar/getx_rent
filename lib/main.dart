import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:project_architecture/API/network_helper/dio_helper.dart';
import 'package:project_architecture/core/cache_helper.dart';
import 'package:project_architecture/core/localizations/translation_contoller.dart';
import 'package:project_architecture/global_presntation/global_features/theme_manager.dart';

import 'app/routes/app_pages.dart';
import 'core/localizations/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();
  DioHelper.init();

  runApp(
    ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        title: "Rent Application",
        theme: Themes.lightTheme,
        initialRoute: AppPages.INITIAL,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
        locale: TranslationController.initalLang,
        translations: Translation(),
      ),
    ),
  );
}
