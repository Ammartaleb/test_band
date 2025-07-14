import 'package:flutter/material.dart';
import 'package:test_band/core/widgets/arabic_layout_widget.dart';
import 'package:test_band/core/widgets/auth_header_widget.dart';
import 'package:test_band/features/login/view/widgets/login_content.dart';

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
            LoginContent(),
          ],
        ),
      ),
    );
  }
}
