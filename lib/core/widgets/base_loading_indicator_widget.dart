import 'package:flutter/material.dart';

class BaseLoadingIndicatorWidget extends StatelessWidget {
  const BaseLoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
