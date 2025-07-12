import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/features/auth/domain/entities/grade_entity.dart';
import 'package:test_band/features/auth/domain/entities/gender_entity.dart';
import 'package:test_band/features/auth/domain/entities/governorate_entity.dart';
import 'package:test_band/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:test_band/features/auth/presentation/widgets/signup_screen_widgets/birthdate_input_field_widget.dart';
import 'package:test_band/features/auth/presentation/widgets/signup_screen_widgets/educational_grade_input_field_widget.dart';
import 'package:test_band/features/auth/presentation/widgets/signup_screen_widgets/first_name_input_field_widget.dart';
import 'package:test_band/features/auth/presentation/widgets/signup_screen_widgets/gender_input_field_widget.dart';
import 'package:test_band/features/auth/presentation/widgets/signup_screen_widgets/governorate_input_field_widget.dart';
import 'package:test_band/features/auth/presentation/widgets/signup_screen_widgets/last_name_input_field_widget.dart';
import 'package:test_band/features/auth/presentation/widgets/signup_screen_widgets/repassword_input_field_widget.dart';
import 'package:test_band/features/auth/presentation/widgets/signup_screen_widgets/signup_phone_screen_number_input_field_widget.dart';
import 'package:test_band/features/auth/presentation/widgets/signup_screen_widgets/signup_screen_password_input_field_widget.dart';

class SignupScreenFormWidget extends StatefulWidget {
  const SignupScreenFormWidget({super.key});

  @override
  State<SignupScreenFormWidget> createState() => _SignupScreenFormWidgetState();
}

class _SignupScreenFormWidgetState extends State<SignupScreenFormWidget> {
  _onChangeGovernorate(GovernorateEntity? governorate) {
    setState(() {
      context.read<AuthCubit>().governorate = governorate;
    });
  }

  _onChangeEducationalGrade(GradeEntity? educationalGrade) {
    setState(() {
      context.read<AuthCubit>().educationalGrade = educationalGrade;
    });
  }

  _onChangeGender(GenderEntity? gender) {
    setState(() {
      context.read<AuthCubit>().gender = gender;
    });
  }

  /// show date picker to select specific date from it
  _showDatePicker() async {
    final pickedDate = await context.read<AuthCubit>().showDatePickerDialog(
      context: context,
    );
    if (pickedDate != null) {
      setState(() {
        context.read<AuthCubit>().birthDateController.text = pickedDate
            .toUtc()
            .toIso8601String();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FirstNameInputFieldWidget(),
          const SizedBox(height: 24),
          const LastNameInputFieldWidget(),
          const SizedBox(height: 24),
          const SignupPhoneNumberInputFieldWidget(),
          const SizedBox(height: 24),
          EducationalGradeInputFieldWidget(
            onChangeChoice: (educationalGrade) =>
                _onChangeEducationalGrade(educationalGrade),
          ),
          const SizedBox(height: 24),
          GenderInputFieldWidget(
            onChangeChoice: (gender) => _onChangeGender(gender),
          ),
          const SizedBox(height: 24),
          BirthDateInputFieldWidget(onTapFunction: () => _showDatePicker()),
          const SizedBox(height: 24),
          GovernorateInputFieldWidget(
            onChangeChoice: (governorate) => _onChangeGovernorate(governorate),
          ),
          const SizedBox(height: 24),
          const SignupScreenPasswordInputFieldWidget(),
          const SizedBox(height: 24),
          const RePasswordInputFieldWidget(),
        ],
      ),
    );
  }
}
