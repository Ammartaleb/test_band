import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/di/dependency_injection.dart';
import 'package:test_band/core/helpers/app_consts.dart';
import 'package:test_band/core/helpers/app_validators.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';
import 'package:test_band/core/widgets/base_drop_down_widget.dart';
import 'package:test_band/features/signup/model/governorate_model.dart';
import 'package:test_band/features/signup/view_model/signup_cubit.dart';

class GovernorateInputField extends StatelessWidget {
  final void Function(GovernorateModel?)? onChangeChoice;
  const GovernorateInputField({super.key, required this.onChangeChoice});

  @override
  Widget build(BuildContext context) {
    return DropDownWidget<GovernorateModel?>(
      hintText: "اختيار المحافظة",
      onValidate: (governorate) =>
          getIt<AppValidators>().validateGovernorateField(input: governorate),
      selectedChoice: context.read<SignupCubit>().governorate,
      onChangeChoice: onChangeChoice,
      choices: AppConsts.governorates
          .map(
            (governorate) => DropdownMenuItem(
              value: governorate,
              child: Text(
                governorate.title,
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
