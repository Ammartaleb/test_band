import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/widgets/base_button_widget.dart';
import 'package:test_band/core/widgets/base_loading_indicator_widget.dart';
import 'package:test_band/features/login/view_model/login_cubit.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.read<LoginCubit>().saveTokenAndNavigateToHomeScreen(
            token: state.loginResponseModel.token ?? "",
          );
        }
        if (state is LoginFailed) {
          context.read<LoginCubit>().handleLoginFailedState(
            message: state.message,
          );
        }
      },
      builder: (context, state) {
        if(state is LoginLoading){
          return const BaseLoadingIndicatorWidget();
        }else{
          return LoginButton(
            onPressFunction: () =>
            context.read<LoginCubit>()..validateAndLogin(),
          );
        }
      },
    );
  }
}

class LoginButton extends StatelessWidget {
  final void Function()? onPressFunction;
  const LoginButton({super.key, this.onPressFunction});

  @override
  Widget build(BuildContext context) {
    return BaseButtonWidget(
      onPressFunction: onPressFunction,
      btnText: "تسجيل الدخول",
    );
  }
}
