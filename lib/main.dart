import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/ad_banner.dart';
import 'package:flutter_ecommerce/model/category.dart';
import 'package:flutter_ecommerce/model/product.dart';
import 'package:flutter_ecommerce/route/app_page.dart';
import 'package:flutter_ecommerce/route/app_route.dart';
import 'package:flutter_ecommerce/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AdBannerAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ProductAdapter());
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
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
