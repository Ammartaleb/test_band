import 'package:flutter/material.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';

class RegisterDoneSuccessfullyContent extends StatelessWidget {
  const RegisterDoneSuccessfullyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "مرحبا بك",
          style: AppTextStyles.bold.toTextStyle().copyWith(
            fontSize: 30,
            color: AppColors.kPrimaryText,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "لقد تم إنشاء حسابك بنجاح.",
          style: AppTextStyles.regular.toTextStyle().copyWith(
            fontSize: 14,
            color: AppColors.kSecondaryText,
          ),
        ),
      ],
    );
  }
}
