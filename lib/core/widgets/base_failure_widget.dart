import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_band/core/helpers/app_assets.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';
import 'package:test_band/core/widgets/base_button_widget.dart';

class BaseFailureWidget extends StatelessWidget {
  final String message;
  final void Function()? onPressFunction;
  const BaseFailureWidget({
    super.key,
    required this.message,
    this.onPressFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: SvgPicture.asset(
              AppIcons.iconError,
              color: AppColors.kError,
            ),
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppTextStyles.regular.toTextStyle().copyWith(
              fontSize: 14,
              color: AppColors.kPrimaryText,
            ),
          ),
          const SizedBox(height: 14),
          BaseButtonWidget(
            onPressFunction: onPressFunction,
            btnText: "حاول مرة اخرى"
          ),
        ],
      ),
    );
  }
}
