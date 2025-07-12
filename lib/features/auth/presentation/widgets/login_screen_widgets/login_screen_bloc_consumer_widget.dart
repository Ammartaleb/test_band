import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/widgets/base_button_widget.dart';
import 'package:test_band/core/widgets/base_loading_indicator_widget.dart';
import 'package:test_band/features/auth/presentation/cubit/auth_cubit.dart';

class LoginScreenBlocConsumerWidget extends StatelessWidget {
  const LoginScreenBlocConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (prev, curr) =>
          curr is LoginLoading || curr is LoginSuccess || curr is LoginFailed,
      buildWhen: (prev, curr) =>
          curr is LoginLoading || curr is LoginSuccess || curr is LoginFailed,
      listener: (context, state) {
        state.whenOrNull(
          loginSuccess: (response) =>
              context.read<AuthCubit>()
                ..saveTokenAndNavigateToHomeScreen(token: response.token),
          loginFailed: (message) =>
              context.read<AuthCubit>()..handleAuthFailure(message: message),
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loginLoading: () => const BaseLoadingIndicatorWidget(),
          orElse: () => LoginButtonWidget(
            onPressFunction: () =>
                context.read<AuthCubit>()..validateAndLogin(),
          ),
        );
      },
    );
  }
}

class LoginButtonWidget extends StatelessWidget {
  final void Function()? onPressFunction;
  const LoginButtonWidget({super.key, this.onPressFunction});

  @override
  Widget build(BuildContext context) {
    return BaseButtonWidget(
      onPressFunction: onPressFunction,
      btnText: "تسجيل الدخول",
    );
  }
}
