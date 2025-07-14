import 'package:flutter/material.dart';
import 'package:test_band/core/routing/app_router.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/utils/app_extensions.dart';
import 'package:test_band/core/widgets/base_button_widget.dart';

class RegisterDoneSuccessfullyLoginButton extends StatelessWidget {
  const RegisterDoneSuccessfullyLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseButtonWidget(
      onPressFunction: () => context.pushNamed(AppRoutes.loginScreenRoute),
      btnText: "تسجيل الدخول",
      btnColor: AppColors.kPrimary,
    );
  }
}
