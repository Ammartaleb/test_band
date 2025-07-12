import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/di/dependency_injection.dart';
import 'package:test_band/core/helpers/app_consts.dart';
import 'package:test_band/core/helpers/app_validators.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';
import 'package:test_band/core/widgets/base_drop_down_widget.dart';
import 'package:test_band/features/auth/domain/entities/grade_entity.dart';
import 'package:test_band/features/auth/presentation/cubit/auth_cubit.dart';

class EducationalGradeInputFieldWidget extends StatelessWidget {
  final void Function(GradeEntity?)? onChangeChoice;
  const EducationalGradeInputFieldWidget({
    super.key,
    required this.onChangeChoice,
  });

  @override
  Widget build(BuildContext context) {
    return DropDownWidget<GradeEntity?>(
      hintText: "اختار المرحلة الدراسية",
      onValidate: (educationalGrade) => getIt<AppValidators>()
          .validateEducationalGradeField(input: educationalGrade),
      selectedChoice: context.read<AuthCubit>().educationalGrade,
      onChangeChoice: onChangeChoice,
      choices: AppConsts.educationalGrades
          .map(
            (educationalGrade) => DropdownMenuItem(
              value: educationalGrade,
              child: Text(
                educationalGrade.title,
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
