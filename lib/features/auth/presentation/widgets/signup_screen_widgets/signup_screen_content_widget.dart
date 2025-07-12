import 'package:flutter/material.dart';
import 'package:test_band/features/auth/presentation/widgets/signup_screen_widgets/signup_screen_bloc_consumer_widget.dart';
import 'package:test_band/features/auth/presentation/widgets/signup_screen_widgets/signup_screen_form_widget.dart';

class SignupScreenContentWidget extends StatelessWidget {
  const SignupScreenContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 25, left: 24, right: 24),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SignupScreenFormWidget(),
            SizedBox(height: 21),
            SignupScreenBlocConsumerWidget(),
          ],
        ),
      ),
    );
  }
}
