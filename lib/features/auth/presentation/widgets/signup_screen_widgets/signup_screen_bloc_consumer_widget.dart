import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/widgets/base_button_widget.dart';
import 'package:test_band/core/widgets/base_loading_indicator_widget.dart';
import 'package:test_band/features/auth/presentation/cubit/auth_cubit.dart';

class SignupScreenBlocConsumerWidget extends StatelessWidget {
  const SignupScreenBlocConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (prev, curr) =>
          curr is SignupLoading ||
          curr is SignupSuccess ||
          curr is SignupFailed,
      buildWhen: (prev, curr) =>
          curr is SignupLoading ||
          curr is SignupSuccess ||
          curr is SignupFailed,
      listener: (context, state) {
        state.whenOrNull(
          signupSuccess: (response) => context.read<AuthCubit>()
            ..saveTokenAndNavigateToRegisterDoneSuccessfullyScreen(
              token: response.token,
            ),
          signupFailed: (message) =>
              context.read<AuthCubit>()..handleAuthFailure(message: message),
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          signupLoading: () => const BaseLoadingIndicatorWidget(),
          orElse: () => SignupButtonWidget(
            onPressFunction: () =>
                context.read<AuthCubit>()..validateAndSignup(),
          ),
        );
      },
    );
  }
}

class SignupButtonWidget extends StatelessWidget {
  final void Function()? onPressFunction;
  const SignupButtonWidget({super.key, this.onPressFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: BaseButtonWidget(
        onPressFunction: onPressFunction,
        btnText: "انشاء حساب",
      ),
    );
  }
}
