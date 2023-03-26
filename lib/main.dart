import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/route/app_page.dart';
import 'package:flutter_ecommerce/route/app_route.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPage.list,
      initialRoute: AppRoute.dashboard,
      debugShowCheckedModeBanner: false,
    );
  }
}
