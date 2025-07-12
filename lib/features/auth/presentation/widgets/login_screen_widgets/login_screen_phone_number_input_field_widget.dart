import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:test_band/features/auth/presentation/widgets/common_widgets/phone_number_input_field_widget.dart';

class LoginScreenPhoneNumberInputFieldWidget extends StatelessWidget {
  const LoginScreenPhoneNumberInputFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneNumberInputFieldWidget(
      textEditingController: context.read<AuthCubit>().phoneController,
    );
  }
}
