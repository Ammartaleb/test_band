import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/features/signup/model/gender_model.dart';
import 'package:test_band/features/signup/model/governorate_model.dart';
import 'package:test_band/features/signup/model/grade_model.dart';
import 'package:test_band/features/signup/view/widgets/signup_screen_widgets/form_fields/birthdate_input_field.dart';
import 'package:test_band/features/signup/view/widgets/signup_screen_widgets/form_fields/educational_grade_input_field.dart';
import 'package:test_band/features/signup/view/widgets/signup_screen_widgets/form_fields/first_name_input_field.dart';
import 'package:test_band/features/signup/view/widgets/signup_screen_widgets/form_fields/gender_input_field.dart';
import 'package:test_band/features/signup/view/widgets/signup_screen_widgets/form_fields/governorate_input_field.dart';
import 'package:test_band/features/signup/view/widgets/signup_screen_widgets/form_fields/last_name_input_field.dart';
import 'package:test_band/features/signup/view/widgets/signup_screen_widgets/form_fields/confirm_password_input_field.dart';
import 'package:test_band/features/signup/view/widgets/signup_screen_widgets/form_fields/phone_input_field.dart';
import 'package:test_band/features/signup/view/widgets/signup_screen_widgets/form_fields/password_input_field.dart';
import 'package:test_band/features/signup/view_model/signup_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  _onChangeGovernorate(GovernorateModel? governorate) {
    setState(() {
      context.read<SignupCubit>().governorate = governorate;
    });
  }

  _onChangeEducationalGrade(GradeModel? educationalGrade) {
    setState(() {
      context.read<SignupCubit>().educationalGrade = educationalGrade;
    });
  }

  _onChangeGender(GenderModel? gender) {
    setState(() {
      context.read<SignupCubit>().gender = gender;
    });
  }

  /// show date picker to select specific date from it
  _showDatePicker() async {
    final pickedDate = await context.read<SignupCubit>().showDatePickerDialog();
    if (pickedDate != null) {
      setState(() {
        context.read<SignupCubit>().birthDateController.text = pickedDate
            .toUtc()
            .toIso8601String();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FirstNameInputField(),
          const SizedBox(height: 24),
          const LastNameInputField(),
          const SizedBox(height: 24),
          const PhoneInputField(),
          const SizedBox(height: 24),
          EducationalGradeInputField(
            onChangeChoice: (educationalGrade) =>
                _onChangeEducationalGrade(educationalGrade),
          ),
          const SizedBox(height: 24),
          GenderInputField(
            onChangeChoice: (gender) => _onChangeGender(gender),
          ),
          const SizedBox(height: 24),
          BirthdateInputField(onTapFunction: () => _showDatePicker()),
          const SizedBox(height: 24),
          GovernorateInputField(
            onChangeChoice: (governorate) => _onChangeGovernorate(governorate),
          ),
          const SizedBox(height: 24),
          const PasswordInputField(),
          const SizedBox(height: 24),
          const ConfirmPasswordInputField(),
        ],
      ),
    );
  }
}
