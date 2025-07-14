import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/features/login/view/widgets/form_fields/login_password_input_field.dart';
import 'package:test_band/features/login/view/widgets/form_fields/login_phone_input_field.dart';
import 'package:test_band/features/login/view_model/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().globalKey,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoginPhoneInputField(),
          SizedBox(height: 24),
          LoginPasswordInputField(),
        ],
      ),
    );
  }
}
