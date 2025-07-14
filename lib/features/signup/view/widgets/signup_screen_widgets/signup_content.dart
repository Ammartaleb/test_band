import 'package:flutter/material.dart';
import 'package:test_band/features/signup/view/widgets/signup_screen_widgets/signup_bloc_consumer.dart';
import 'package:test_band/features/signup/view/widgets/signup_screen_widgets/signup_form.dart';

class SignupContent extends StatelessWidget {
  const SignupContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 25, left: 24, right: 24),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SignupForm(),
            SizedBox(height: 21),
            SignupBlocConsumer(),
          ],
        ),
      ),
    );
  }
}
