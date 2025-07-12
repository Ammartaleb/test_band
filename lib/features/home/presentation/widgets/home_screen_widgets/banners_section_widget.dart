import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_band/core/helpers/app_consts.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/utils/app_extensions.dart';
import 'package:test_band/features/home/domain/entities/banner_response_entity.dart';

class BannersSectionWidget extends StatefulWidget {
  final List<BannerEntity> banners;
  const BannersSectionWidget({super.key, required this.banners});

  @override
  State<BannersSectionWidget> createState() => _BannersSectionWidgetState();
}

class _BannersSectionWidgetState extends State<BannersSectionWidget> {
  int _currentIndex = 0;
  List<BannerEntity> _banners = [];

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
            CarouselBannersWidget(
              banners: _banners,
              onPageChanged: (index, reason) => _changeIndex(index),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CarouselBannersIndicatorsWidget(
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

class CarouselBannersWidget extends StatelessWidget {
  final Function(int, CarouselPageChangedReason)? onPageChanged;
  final List<BannerEntity> banners;
  const CarouselBannersWidget({
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
          banner.imageUrl,
          fit: BoxFit.cover,
          width: context.width(),
        );
      }).toList(),
    );
  }
}

class CarouselBannersIndicatorsWidget extends StatelessWidget {
  final int currentIndex;
  final List<BannerEntity> banners;
  const CarouselBannersIndicatorsWidget({
    super.key,
    required this.currentIndex,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.kBlurBanner.withOpacity(0.6),
                  AppColors.kBlurBanner.withOpacity(0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(banners.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: 3,
                  width: 56,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(100),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
