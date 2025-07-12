import 'package:flutter/material.dart';
import 'package:test_band/core/helpers/app_assets.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';
import 'package:test_band/core/utils/app_extensions.dart';

class AuthHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const AuthHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      height: 259, // adjust height as needed
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1C164F), Color(0xFF2A2172)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          // Image 1 (e.g. decorative background shape)
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              AppImages.backgroundPngImage,
              width: context.width(),
              fit: BoxFit.cover,
            ),
          ),

          // Image 2 (e.g. logo in the corner)
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              AppImages.foregroundPngImage,
              width: context.width(),
              fit: BoxFit.cover,
            ),
          ),

          // Header content
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset(AppImages.appLogoPngImage),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: AppTextStyles.bold.toTextStyle().copyWith(
                      fontSize: 28,
                      color: AppColors.kWhite,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: AppTextStyles.regular.toTextStyle().copyWith(
                      fontSize: 18,
                      color: AppColors.kWhite,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
