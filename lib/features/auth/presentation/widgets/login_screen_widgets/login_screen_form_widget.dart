import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:test_band/features/auth/presentation/widgets/login_screen_widgets/login_screen_password_input_field_widget.dart';
import 'package:test_band/features/auth/presentation/widgets/login_screen_widgets/login_screen_phone_number_input_field_widget.dart';

class LoginScreenFormWidget extends StatelessWidget {
  const LoginScreenFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().globalKey,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoginScreenPhoneNumberInputFieldWidget(),
          SizedBox(height: 24),
          LoginScreenPasswordInputFieldWidget(),
        ],
      ),
    );
  }
}
