import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';
import 'package:test_band/features/auth/presentation/cubit/auth_cubit.dart';

class LoginScreenSignupChoiceWidget extends StatelessWidget {
  const LoginScreenSignupChoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'ليس لديك حساب؟',
              style: AppTextStyles.regular.toTextStyle().copyWith(
                fontSize: 14,
                color: AppColors.kSecondary,
              ),
            ),
            TextSpan(
              text: 'انشاء حساب جديد',
              style: AppTextStyles.bold.toTextStyle().copyWith(
                fontSize: 14,
                color: AppColors.kPrimary,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.read<AuthCubit>().navigateToSignupScreen();
                },
            ),
          ],
        ),
      ),
    );
  }
}
