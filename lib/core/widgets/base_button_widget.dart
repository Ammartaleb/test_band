import 'package:flutter/material.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';
import 'package:test_band/core/utils/app_extensions.dart';

class BaseButtonWidget extends StatelessWidget {
  final void Function()? onPressFunction;
  final String btnText;
  final double btnFontSize;
  final Color btnColor;
  final Color btnTextColor;
  final double? width;
  final double? height;
  final double borderRadius;

  const BaseButtonWidget({
    super.key,
    required this.onPressFunction,
    required this.btnText,
    this.height,
    this.btnFontSize = 16,
    this.width,
    this.btnColor = AppColors.kSecondary,
    this.btnTextColor = AppColors.kWhite,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width(),
      height: height ?? 44,
      child: ElevatedButton(
        onPressed: onPressFunction,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          btnText,
          style: AppTextStyles.regular.toTextStyle().copyWith(
            color: btnTextColor,
            fontSize: btnFontSize,
          ),
        ),
      ),
    );
  }
}
