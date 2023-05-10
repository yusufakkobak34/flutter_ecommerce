import 'package:flutter_ecommerce/controller/auth/auth_controller.dart';
import 'package:flutter_ecommerce/controller/category/category_controller.dart';
import 'package:flutter_ecommerce/controller/dashboard/dashboard_controller.dart';
import 'package:flutter_ecommerce/controller/home/home_controller.dart';
import 'package:flutter_ecommerce/controller/product/product_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(ProductController());
    Get.put(CategoryController());
    Get.put(AuthController());
  }
}
