part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  /// [Login] api request states
  const factory AuthState.loginLoading() = LoginLoading;
  const factory AuthState.loginSuccess({required LoginResponseEntity login}) =
      LoginSuccess;
  const factory AuthState.loginFailed({required String message}) = LoginFailed;

  /// [Signup] api request states
  const factory AuthState.signupLoading() = SignupLoading;
  const factory AuthState.signupSuccess({
    required SignupResponseEntity signup,
  }) = SignupSuccess;
  const factory AuthState.signupFailed({required String message}) =
      SignupFailed;
}
