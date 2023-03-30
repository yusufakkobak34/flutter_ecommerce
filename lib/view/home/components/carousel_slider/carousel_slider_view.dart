import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/ad_banner.dart';
import 'package:flutter_ecommerce/view/home/components/carousel_slider/banner_card.dart';

class CarouselSliderView extends StatefulWidget {
  final List<AdBanner> bannerList;
  const CarouselSliderView({super.key, required this.bannerList});

  @override
  State<CarouselSliderView> createState() => _CarouselSliderViewState();
}

class _CarouselSliderViewState extends State<CarouselSliderView> {
  int _currentIndex = 0;
  late List<Widget> _bannerList;

  @override
  void initState() {
    // TODO: implement initState
    _bannerList =
        widget.bannerList.map((e) => BannerCard(imageUrl: e.image)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
      ],
    );
  }
}
