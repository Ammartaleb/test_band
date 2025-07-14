import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/di/dependency_injection.dart';
import 'package:test_band/core/helpers/app_consts.dart';
import 'package:test_band/core/helpers/app_validators.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';
import 'package:test_band/core/widgets/base_drop_down_widget.dart';
import 'package:test_band/features/signup/model/gender_model.dart';
import 'package:test_band/features/signup/view_model/signup_cubit.dart';

class GenderInputField extends StatelessWidget {
  final void Function(GenderModel?)? onChangeChoice;
  const GenderInputField({super.key, required this.onChangeChoice});

  @override
  Widget build(BuildContext context) {
    return DropDownWidget<GenderModel?>(
      hintText: "الجنس",
      onValidate: (gender) =>
          getIt<AppValidators>().validateGenderField(input: gender),
      selectedChoice: context.read<SignupCubit>().gender,
      onChangeChoice: onChangeChoice,
      choices: AppConsts.genders
          .map(
            (gender) => DropdownMenuItem(
              value: gender,
              child: Text(
                gender.value,
                textAlign: TextAlign.start,
                style: AppTextStyles.regular.toTextStyle().copyWith(
                  fontSize: 12,
                  color: AppColors.kPrimaryText,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
