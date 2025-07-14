import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/di/dependency_injection.dart';
import 'package:test_band/core/helpers/app_consts.dart';
import 'package:test_band/core/helpers/app_validators.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';
import 'package:test_band/core/widgets/base_drop_down_widget.dart';
import 'package:test_band/features/signup/model/grade_model.dart';
import 'package:test_band/features/signup/view_model/signup_cubit.dart';

class EducationalGradeInputField extends StatelessWidget {
  final void Function(GradeModel?)? onChangeChoice;
  const EducationalGradeInputField({
    super.key,
    required this.onChangeChoice,
  });

  @override
  Widget build(BuildContext context) {
    return DropDownWidget<GradeModel?>(
      hintText: "اختار المرحلة الدراسية",
      onValidate: (educationalGrade) => getIt<AppValidators>()
          .validateEducationalGradeField(input: educationalGrade),
      selectedChoice: context.read<SignupCubit>().educationalGrade,
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
