import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/di/dependency_injection.dart';
import 'package:test_band/core/helpers/app_validators.dart';
import 'package:test_band/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:test_band/features/auth/presentation/widgets/common_widgets/password_input_field_widget.dart';

class LoginScreenPasswordInputFieldWidget extends StatelessWidget {
  const LoginScreenPasswordInputFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PasswordInputFieldWidget(
      textEditingController: context.read<AuthCubit>().passwordController,
      onValidate: (input) =>
          getIt<AppValidators>().validatePassword(input: input),
    );
  }
}
