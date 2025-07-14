part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState{}

class LoginLoading extends LoginState{}

class LoginSuccess extends LoginState{
  final LoginResponseModel loginResponseModel;

  LoginSuccess({required this.loginResponseModel});
}

class LoginFailed extends LoginState{
  final String message;

  LoginFailed({required this.message});
}
