import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/di/dependency_injection.dart';
import 'package:test_band/core/helpers/app_consts.dart';
import 'package:test_band/core/helpers/app_validators.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';
import 'package:test_band/core/widgets/base_drop_down_widget.dart';
import 'package:test_band/features/auth/domain/entities/gender_entity.dart';
import 'package:test_band/features/auth/presentation/cubit/auth_cubit.dart';

class GenderInputFieldWidget extends StatelessWidget {
  final void Function(GenderEntity?)? onChangeChoice;
  const GenderInputFieldWidget({super.key, required this.onChangeChoice});

  @override
  Widget build(BuildContext context) {
    return DropDownWidget<GenderEntity?>(
      hintText: "الجنس",
      onValidate: (gender) =>
          getIt<AppValidators>().validateGenderField(input: gender),
      selectedChoice: context.read<AuthCubit>().gender,
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
