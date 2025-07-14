import 'package:flutter/material.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/features/home/model/banner_response_model.dart';

class CarouselOfBannersIndicators extends StatelessWidget {
  final int currentIndex;
  final List<BannerModel> banners;
  const CarouselOfBannersIndicators({
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