import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/component/main_header.dart';
import 'package:flutter_ecommerce/controller/controllers.dart';
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
            if (homeController.isBannerLoading.value) {
              return CarouselLoading;
            } else {
              return Container();
            }
          })
        ],
      ),
    );
  }
}
