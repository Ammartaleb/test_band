import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_band/core/helpers/app_consts.dart';
import 'package:test_band/core/utils/app_extensions.dart';
import 'package:test_band/features/home/model/banner_response_model.dart';

class CarouselOfBanners extends StatelessWidget {
  final Function(int, CarouselPageChangedReason)? onPageChanged;
  final List<BannerModel> banners;
  const CarouselOfBanners({
    super.key,
    this.onPageChanged,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 240,
        autoPlay: true,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        onPageChanged: onPageChanged,
      ),
      items: banners.map((banner) {
        return Image.network(
          banner.imageUrl ?? AppConsts.dummyCourseImage,
          fit: BoxFit.cover,
          width: context.width(),
        );
      }).toList(),
    );
  }
}