import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/widgets/base_phone_number_input_field.dart';
import 'package:test_band/features/login/view_model/login_cubit.dart';

class LoginPhoneInputField extends StatelessWidget {
  const LoginPhoneInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePhoneNumberInputField(
      textEditingController: context.read<LoginCubit>().phoneController,
    );
  }
}