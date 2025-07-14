import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/helpers/app_validators.dart';
import 'package:test_band/core/widgets/base_password_input_field.dart';
import 'package:test_band/di/dependency_injection.dart';
import 'package:test_band/features/login/view_model/login_cubit.dart';

class LoginPasswordInputField extends StatelessWidget {
  const LoginPasswordInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePasswordInputField(
      textEditingController: context.read<LoginCubit>().passwordController,
      onValidate: (input) =>
          getIt<AppValidators>().validatePassword(input: input),
    );
  }
}