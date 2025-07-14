import 'package:flutter/material.dart';
import 'package:test_band/core/widgets/arabic_layout_widget.dart';
import 'package:test_band/core/widgets/auth_header_widget.dart';
import 'package:test_band/features/signup/view/widgets/signup_screen_widgets/signup_content.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArabicLayoutWidget(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 260,
                flexibleSpace: FlexibleSpaceBar(
                  background: AuthHeaderWidget(
                    title: "انشاء حساب",
                    subtitle: "يجب عليك عليك ادخال بياناتك صحيحة لتجنب المشاكل و الاخطاء",
                  ),
                ),
              ),
            ];
          },
          body: const SignupContent(),
        ),
      ),
    );
  }
}