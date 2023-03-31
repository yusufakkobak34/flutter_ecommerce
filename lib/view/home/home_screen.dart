import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/component/main_header.dart';
import 'package:flutter_ecommerce/controller/controllers.dart';
import 'package:flutter_ecommerce/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:flutter_ecommerce/view/home/components/popular_category/popular_category_loading.dart';
import 'package:get/get.dart';

import 'components/carousel_slider/carousel_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Obx(() {
            if (homeController.bannerList.isNotEmpty) {
              return CarouselSliderView(bannerList: homeController.bannerList);
            } else {
              return CarouselLoading();
            }
          }),
          Obx(() {
            if (homeController.popularCategoryList.isNotEmpty) {
              return PopularCategoryLoading();
            } else {
              return PopularCategoryLoading();
            }
          })
        ],
      ),
    );
  }
}
