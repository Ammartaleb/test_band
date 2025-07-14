import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/widgets/base_button_widget.dart';
import 'package:test_band/core/widgets/base_loading_indicator_widget.dart';
import 'package:test_band/features/signup/view_model/signup_cubit.dart';

class SignupBlocConsumer extends StatelessWidget {
  const SignupBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if(state is SignupSuccess){
          context.read<SignupCubit>()
            .saveTokenAndNavigateToRegisterDoneSuccessfullyScreen(
              token: state.signupResponseModel.token ?? "",
            );
        }
        if(state is SignupFailed){
          context.read<SignupCubit>().handleAuthFailure(message: state.message);
        }
      },
      builder: (context, state) {
        if(state is SignupLoading){
          return const BaseLoadingIndicatorWidget();
        }else{
          return SignupButton(
            onPressFunction: () =>
            context.read<SignupCubit>()..validateAndSignup(),
          );
        }
      },
    );
  }
}

class SignupButton extends StatelessWidget {
  final void Function()? onPressFunction;
  const SignupButton({super.key, this.onPressFunction});

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
