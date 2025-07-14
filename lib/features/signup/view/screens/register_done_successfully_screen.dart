import 'package:flutter/material.dart';
import 'package:test_band/core/widgets/arabic_layout_widget.dart';
import 'package:test_band/features/signup/view/widgets/register_done_successfully_screen_widgets/register_done_successfully_content.dart';
import 'package:test_band/features/signup/view/widgets/register_done_successfully_screen_widgets/register_done_successfully_image_placeholder.dart';
import 'package:test_band/features/signup/view/widgets/register_done_successfully_screen_widgets/register_done_successfully_login_button.dart';

class RegisterDoneSuccessfullyScreen extends StatelessWidget {
  const RegisterDoneSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ArabicLayoutWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              RegisterDoneSuccessfullyImagePlaceholder(),
              Spacer(),
              RegisterDoneSuccessfullyContent(),
              Spacer(),
              RegisterDoneSuccessfullyLoginButton(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
