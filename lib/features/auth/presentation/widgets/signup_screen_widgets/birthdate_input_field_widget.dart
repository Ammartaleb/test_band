import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_band/core/di/dependency_injection.dart';
import 'package:test_band/core/helpers/app_assets.dart';
import 'package:test_band/core/helpers/app_validators.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/widgets/base_text_field_widget.dart';
import 'package:test_band/features/auth/presentation/cubit/auth_cubit.dart';

class BirthDateInputFieldWidget extends StatelessWidget {
  final void Function()? onTapFunction;
  const BirthDateInputFieldWidget({super.key, this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return BaseTextFieldWidget(
      controller: context.read<AuthCubit>().birthDateController,
      keyboardType: TextInputType.datetime,
      labelText: "التاريخ",
      hintText: "التاريخ",
      onTapFunction: onTapFunction,
      validator: (input) =>
          getIt<AppValidators>().validateBirthDateInputField(input: input),
      prefixIcon: SizedBox(
        width: 17,
        height: 17,
        child: SvgPicture.asset(
          AppIcons.iconCalendar,
          color: AppColors.kPrimary,
        ),
      ),
    );
  }
}
