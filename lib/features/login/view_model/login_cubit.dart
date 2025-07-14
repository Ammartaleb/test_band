import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:test_band/core/helpers/token_storage.dart';
import 'package:test_band/core/network/api_exception.dart';
import 'package:test_band/core/network/api_parameters/body_parameters.dart';
import 'package:test_band/core/routing/app_router.dart';
import 'package:test_band/core/utils/app_extensions.dart';
import 'package:test_band/core/widgets/base_dialog_widget.dart';
import 'package:test_band/di/dependency_injection.dart';
import 'package:test_band/features/login/model/login_response_model.dart';
import 'package:test_band/features/login/repository/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final phoneController = TextEditingController(text: "+964");
  final passwordController = TextEditingController();

  LoginCubit({required this.loginRepository}) : super(LoginInitial());

  login({required LoginApiRequestBody requestBody}) async {
    try {
      emit(LoginLoading());
      final response = await loginRepository.login(
        requestBody: requestBody,
      );
      emit(LoginSuccess(loginResponseModel: response));
    } on ServerException catch (e) {
      emit(LoginFailed(message: e.message));
    }
  }

  saveToken({required String token}) {
    getIt<TokenStorage>().saveToken(token);
  }

  navigateToHomeScreen() {
    AppNavigator.navigatorKey.currentContext!.pushNamedAndRemoveUntil(
      AppRoutes.homeScreenRoute,
    );
  }

  navigateToSignupScreen(){
    AppNavigator.navigatorKey.currentContext!.pushNamedAndRemoveUntil(
      AppRoutes.signupScreenRoute,
    );
  }

  saveTokenAndNavigateToHomeScreen({required String token}) {
    saveToken(token: token);
    navigateToHomeScreen();
  }

  handleLoginFailedState({required String message}) {
    showDialog(
      context: AppNavigator.navigatorKey.currentContext!,
      builder: (context) => BaseDialogWidget(message: message),
    );
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
}
