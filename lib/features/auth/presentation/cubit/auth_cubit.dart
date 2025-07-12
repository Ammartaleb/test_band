import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_band/core/di/dependency_injection.dart';
import 'package:test_band/core/helpers/location_helper.dart';
import 'package:test_band/core/helpers/token_storage.dart';
import 'package:test_band/core/networking/api_exception.dart';
import 'package:test_band/core/networking/api_parameters/body_parameters.dart';
import 'package:test_band/core/routing/app_navigator.dart';
import 'package:test_band/core/routing/app_routes.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/utils/app_extensions.dart';
import 'package:test_band/core/widgets/base_dialog_widget.dart';
import 'package:test_band/features/auth/domain/entities/grade_entity.dart';
import 'package:test_band/features/auth/domain/entities/gender_entity.dart';
import 'package:test_band/features/auth/domain/entities/governorate_entity.dart';
import 'package:test_band/features/auth/domain/entities/login_response_entity.dart';
import 'package:test_band/features/auth/domain/entities/signup_response_entity.dart';
import 'package:test_band/features/auth/domain/usecases/login_usecase.dart';
import 'package:test_band/features/auth/domain/usecases/signup_usecase.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  AuthCubit({required this.loginUseCase, required this.signupUseCase})
    : super(const AuthState.initial());

  final phoneController = TextEditingController(text: "+964");
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final birthDateController = TextEditingController();

  final globalKey = GlobalKey<FormState>();

  DateTime startDate = DateTime(1900);
  DateTime endDate = DateTime(2100);
  DateTime currentDate = DateTime.now();

  GradeEntity? educationalGrade;
  GenderEntity? gender;
  GovernorateEntity? governorate;

  login({required LoginApiRequestBody requestBody}) async {
    emit(const AuthState.loginLoading());
    try {
      final response = await loginUseCase.call(requestBody);
      emit(AuthState.loginSuccess(login: response));
    } on ServerException catch (e) {
      emit(AuthState.loginFailed(message: e.message));
    }
  }

  signup({required SignupApiRequestBody requestBody}) async {
    emit(const AuthState.signupLoading());
    try {
      final response = await signupUseCase.call(requestBody);
      emit(AuthState.signupSuccess(signup: response));
    } on ServerException catch (e) {
      emit(AuthState.signupFailed(message: e.message));
    }
  }

  Future<String?> getFcmToken() async {
    try {
      final firebaseMessaging = getIt<FirebaseMessaging>();
      final token = await firebaseMessaging.getToken();
      return token;
    } catch (e) {
      return null;
    }
  }

  validateAndLogin() async {
    if (globalKey.currentState?.validate() ?? false) {
      globalKey.currentState?.save();
      final fcmToken = await getFcmToken();
      final requestBody = LoginApiRequestBody(
        phone: phoneController.text,
        password: passwordController.text,
        fcmToken: fcmToken ?? "",
      );
      login(requestBody: requestBody);
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

  /// Displays a [DatePicker] dialog for selecting a specific date.
  Future<DateTime?> showDatePickerDialog({
    required BuildContext context,
  }) async {
    final result = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: startDate,
      lastDate: endDate,
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            splashColor: AppColors.kPrimaryText,
            colorScheme: const ColorScheme.light(
              primary: AppColors.kPrimary,
              onSecondary: AppColors.kSecondaryText,
              onPrimary: AppColors.kWhite,
            ),
            dialogTheme: const DialogThemeData(
              backgroundColor: AppColors.kWhite,
            ),
          ),
          child: child!,
        );
      },
    );
    return result;
  }

  navigateToHomeScreen() {
    AppNavigator.navigatorKey.currentContext!.pushNamedAndRemoveUntil(
      AppRoutes.homeScreenRoute,
    );
  }

  navigateToSignupScreen() {
    AppNavigator.navigatorKey.currentContext!.pushNamed(
      AppRoutes.signupScreenRoute,
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

  saveTokenAndNavigateToHomeScreen({required String token}) {
    saveToken(token: token);
    navigateToHomeScreen();
  }

  handleAuthFailure({required String message}) {
    showDialog(
      context: AppNavigator.navigatorKey.currentContext!,
      builder: (context) => BaseDialogWidget(message: message),
    );
  }
}
