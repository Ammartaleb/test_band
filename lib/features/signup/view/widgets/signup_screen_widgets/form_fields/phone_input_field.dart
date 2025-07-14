import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/widgets/base_phone_number_input_field.dart';
import 'package:test_band/features/signup/view_model/signup_cubit.dart';

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePhoneNumberInputField(
      textEditingController: context.read<SignupCubit>().phoneController,
    );
  }
}
