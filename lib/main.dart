import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_band/core/di/dependency_injection.dart';
import 'package:test_band/core/routing/app_navigator.dart';
import 'package:test_band/core/routing/app_router.dart';
import 'package:test_band/core/routing/app_routes.dart';
import 'package:test_band/core/theming/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
