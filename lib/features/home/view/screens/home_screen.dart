import 'package:flutter/material.dart';
import 'package:test_band/core/widgets/arabic_layout_widget.dart';
import 'package:test_band/features/home/view/widgets/home_educational_grade_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ArabicLayoutWidget(
        child: HomeEducationalGradeBlocBuilder(),
      ),
    );
  }
}
