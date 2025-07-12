import 'package:flutter/material.dart';
import 'package:test_band/core/widgets/arabic_layout_widget.dart';
import 'package:test_band/core/widgets/auth_header_widget.dart';
import 'package:test_band/features/auth/presentation/widgets/login_screen_widgets/login_screen_bloc_consumer_widget.dart';
import 'package:test_band/features/auth/presentation/widgets/login_screen_widgets/login_screen_form_widget.dart';
import 'package:test_band/features/auth/presentation/widgets/login_screen_widgets/login_screen_signup_choice_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ArabicLayoutWidget(
        child: Column(
          children: [
            AuthHeaderWidget(
              title: "تسجيل الدخول",
              subtitle: "يجب عليك اضافة بياناتك الخاصة لتسهيل التواصل معك",
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                child: Column(
                  children: [
                    LoginScreenFormWidget(),
                    SizedBox(height: 20),
                    LoginScreenBlocConsumerWidget(),
                    SizedBox(height: 20),
                    LoginScreenSignupChoiceWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
