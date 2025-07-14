part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final SignupResponseModel signupResponseModel;

  SignupSuccess({required this.signupResponseModel});
}

class SignupFailed extends SignupState {
  final String message;

  SignupFailed({required this.message});
}
