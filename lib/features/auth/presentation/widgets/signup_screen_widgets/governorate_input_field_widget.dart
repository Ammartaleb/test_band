import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/di/dependency_injection.dart';
import 'package:test_band/core/helpers/app_consts.dart';
import 'package:test_band/core/helpers/app_validators.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';
import 'package:test_band/core/widgets/base_drop_down_widget.dart';
import 'package:test_band/features/auth/domain/entities/governorate_entity.dart';
import 'package:test_band/features/auth/presentation/cubit/auth_cubit.dart';

class GovernorateInputFieldWidget extends StatelessWidget {
  final void Function(GovernorateEntity?)? onChangeChoice;
  const GovernorateInputFieldWidget({super.key, required this.onChangeChoice});

  @override
  Widget build(BuildContext context) {
    return DropDownWidget<GovernorateEntity?>(
      hintText: "اختيار المحافظة",
      onValidate: (governorate) =>
          getIt<AppValidators>().validateGovernorateField(input: governorate),
      selectedChoice: context.read<AuthCubit>().governorate,
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
