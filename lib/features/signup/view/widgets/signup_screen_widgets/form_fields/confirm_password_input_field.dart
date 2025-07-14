import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/di/dependency_injection.dart';
import 'package:test_band/core/helpers/app_validators.dart';
import 'package:test_band/core/widgets/base_password_input_field.dart';
import 'package:test_band/features/signup/view_model/signup_cubit.dart';

class ConfirmPasswordInputField extends StatelessWidget {
  const ConfirmPasswordInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePasswordInputField(
      textEditingController: context.read<SignupCubit>().rePasswordController,
      text: "تأكيد كلمة المرور",
      onValidate: (input) => getIt<AppValidators>().validateRePassword(
        password: context.read<SignupCubit>().passwordController.text,
        rePassword: context.read<SignupCubit>().rePasswordController.text,
      ),
    );
  }
}
