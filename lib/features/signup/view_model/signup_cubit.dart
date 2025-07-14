import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_band/core/helpers/location_helper.dart';
import 'package:test_band/core/helpers/token_storage.dart';
import 'package:test_band/core/network/api_exception.dart';
import 'package:test_band/core/network/api_parameters/body_parameters.dart';
import 'package:test_band/core/routing/app_router.dart';
import 'package:test_band/core/utils/app_extensions.dart';
import 'package:test_band/core/widgets/base_dialog_widget.dart';
import 'package:test_band/di/dependency_injection.dart';
import 'package:test_band/features/signup/model/gender_model.dart';
import 'package:test_band/features/signup/model/governorate_model.dart';
import 'package:test_band/features/signup/model/grade_model.dart';
import 'package:test_band/features/signup/model/signup_response_model.dart';
import 'package:test_band/features/signup/repository/signup_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepository signupRepository;

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final phoneController = TextEditingController(text: "+964");
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final birthDateController = TextEditingController();

  GradeModel? educationalGrade;
  GenderModel? gender;
  GovernorateModel? governorate;

  DateTime startDate = DateTime(1900);
  DateTime endDate = DateTime(2100);
  DateTime currentDate = DateTime.now();

  SignupCubit({required this.signupRepository}) : super(SignupInitial());

  signup({required SignupApiRequestBody requestBody}) async {
    emit(SignupLoading());
    try {
      final response = await signupRepository.signup(requestBody: requestBody);
      emit(SignupSuccess(signupResponseModel: response));
    } on ServerException catch (e) {
      emit(SignupFailed(message: e.message));
    }
  }

  validateAndSignup() async {
    final position = await getIt<LocationHelper>().getCurrentLocation();
    if (globalKey.currentState?.validate() ?? true) {
      globalKey.currentState?.save();
      final requestBody = SignupApiRequestBody(
        phone: phoneController.text,
        password: passwordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        gender: gender?.key ?? "",
        governorateId: governorate?.id ?? 0,
        educationalGradeId: educationalGrade?.id ?? 0,
        birthDate: birthDateController.text,
        rePassword: rePasswordController.text,
        latitude: position == null
            ? 33.5102.toString()
            : position.latitude.toString(),
        longitude: position == null
            ? 36.29128.toString()
            : position.longitude.toString(),
        locationName: "Baghdad St",
      );
      signup(requestBody: requestBody);
    }
  }

  Future<DateTime?> showDatePickerDialog() async {
    final result = await showDatePicker(
      context: AppNavigator.navigatorKey.currentContext!,
      initialDate: currentDate,
      firstDate: startDate,
      lastDate: endDate,
    );
    return result;
  }

  handleAuthFailure({required String message}) {
    showDialog(
      context: AppNavigator.navigatorKey.currentContext!,
      builder: (context) => BaseDialogWidget(message: message),
    );
  }

  navigateToRegisterDoneSuccessfullyScreen() {
    AppNavigator.navigatorKey.currentContext!.pushNamedAndRemoveUntil(
      AppRoutes.registerDoneSuccessfullyScreenRoute,
    );
  }

  saveToken({required String token}) {
    getIt<TokenStorage>().saveToken(token);
  }

  saveTokenAndNavigateToRegisterDoneSuccessfullyScreen({
    required String token,
  }) {
    saveToken(token: token);
    navigateToRegisterDoneSuccessfullyScreen();
  }
}
