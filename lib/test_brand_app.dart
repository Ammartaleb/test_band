import 'package:flutter/material.dart';
import 'package:test_band/core/routing/app_router.dart';
import 'package:test_band/core/theming/app_theme.dart';

class TestBrandApp extends StatelessWidget {
  const TestBrandApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Band',
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      theme: AppTheme.applicationThemeData,
      locale: const Locale("ar"),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoutes.loginScreenRoute,
    );
  }
}