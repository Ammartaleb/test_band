import 'package:flutter/material.dart';
import 'package:test_band/core/widgets/arabic_layout_widget.dart';
import 'package:test_band/features/auth/presentation/widgets/register_done_successfully_screen_widgets/register_done_successfully_screen_content_widget.dart';
import 'package:test_band/features/auth/presentation/widgets/register_done_successfully_screen_widgets/register_done_successfully_screen_image_placeholder_widget.dart';
import 'package:test_band/features/auth/presentation/widgets/register_done_successfully_screen_widgets/register_done_successfully_screen_login_button_widget.dart';

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
              RegisterDoneSuccessfullyScreenImagePlaceholderWidget(),
              Spacer(),
              RegisterDoneSuccessfullyScreenContentWidget(),
              Spacer(),
              RegisterDoneSuccessfullyScreenLoginButtonWidget(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
