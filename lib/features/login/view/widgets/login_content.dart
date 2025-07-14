import 'package:flutter/material.dart';
import 'package:test_band/features/login/view/widgets/login_bloc_consumer.dart';
import 'package:test_band/features/login/view/widgets/login_form.dart';
import 'package:test_band/features/login/view/widgets/signup_choice.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 24, left: 24, right: 24),
        child: Column(
          children: [
            LoginForm(),
            SizedBox(height: 20),
            LoginBlocConsumer(),
            SizedBox(height: 20),
            SignupChoice(),
          ],
        ),
      ),
    );
  }
}
