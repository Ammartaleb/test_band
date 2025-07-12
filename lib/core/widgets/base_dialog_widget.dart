import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_band/core/helpers/app_assets.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';
import 'package:test_band/core/utils/app_extensions.dart';
import 'package:test_band/core/widgets/base_button_widget.dart';

class BaseDialogWidget extends StatelessWidget {
  final String iconPath;
  final String message;

  const BaseDialogWidget({
    super.key,
    this.iconPath = AppIcons.iconError,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: SizedBox(
                width: 85,
                height: 85,
                child: SvgPicture.asset(iconPath, color: AppColors.kError),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              message,
              style: AppTextStyles.regular.toTextStyle().copyWith(
                color: AppColors.kPrimaryText,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            BaseButtonWidget(
              onPressFunction: () => context.pop(),
              btnText: "حسنا",
            ),
          ],
        ),
      ),
    );
  }
}
