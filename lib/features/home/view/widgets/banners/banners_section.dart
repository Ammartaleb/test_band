import 'package:flutter/material.dart';
import 'package:test_band/core/helpers/app_consts.dart';
import 'package:test_band/features/home/model/banner_response_model.dart';
import 'package:test_band/features/home/view/widgets/banners/carousel_of_banners.dart';
import 'package:test_band/features/home/view/widgets/banners/carousel_of_banners_indicators.dart';

class BannersSection extends StatefulWidget {
  final List<BannerModel> banners;
  const BannersSection({super.key, required this.banners});

  @override
  State<BannersSection> createState() => _BannersSectionState();
}

class _BannersSectionState extends State<BannersSection> {
  int _currentIndex = 0;
  List<BannerModel> _banners = [];

  _changeIndex(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    _banners = widget.banners;
    _banners = AppConsts.banners;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            CarouselOfBanners(
              banners: _banners,
              onPageChanged: (index, reason) => _changeIndex(index),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CarouselOfBannersIndicators(
                currentIndex: _currentIndex,
                banners: _banners,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
