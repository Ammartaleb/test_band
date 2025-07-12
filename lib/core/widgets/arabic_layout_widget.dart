import 'package:flutter/material.dart';

class ArabicLayoutWidget extends StatelessWidget {
  final Widget child;
  const ArabicLayoutWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: child);
  }
}
