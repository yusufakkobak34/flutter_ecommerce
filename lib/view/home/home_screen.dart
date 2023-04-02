import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/component/main_header.dart';
import 'package:flutter_ecommerce/controller/controllers.dart';
import 'package:flutter_ecommerce/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:flutter_ecommerce/view/home/components/popular_category/popular_category.dart';
import 'package:flutter_ecommerce/view/home/components/popular_category/popular_category_loading.dart';
import 'package:flutter_ecommerce/view/home/components/popular_product/popular_product_loading.dart';
import 'package:flutter_ecommerce/view/home/components/section_title.dart';
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
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Obx(() {
                    if (homeController.bannerList.isNotEmpty) {
                      return CarouselSliderView(
                          bannerList: homeController.bannerList);
                    } else {
                      return CarouselLoading();
                    }
                  }),
                  const SectionTitle(title: "Popüler Kategoriler"),
                  Obx(() {
                    if (homeController.popularCategoryList.isNotEmpty) {
                      return PopularCategory(
                        categories: homeController.popularCategoryList,
                      );
                    } else {
                      return PopularCategoryLoading();
                    }
                  }),
                  const SectionTitle(title: "Popüler Ürünler"),
                  Obx(() {
                    if (homeController.popularProductList.isNotEmpty) {
                      return PopularProductLoading();
                    } else {
                      return PopularProductLoading();
                    }
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
