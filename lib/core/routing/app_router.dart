import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/di/dependency_injection.dart';
import 'package:test_band/core/routing/app_routes.dart';
import 'package:test_band/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:test_band/features/auth/presentation/screens/login_screen.dart';
import 'package:test_band/features/auth/presentation/screens/register_done_successfully_screen.dart';
import 'package:test_band/features/auth/presentation/screens/signup_screen.dart';
import 'package:test_band/features/home/presentation/screens/home_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const LoginScreen(),
          ),
        );
      case AppRoutes.signupScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const SignupScreen(),
          ),
        );
      case AppRoutes.registerDoneSuccessfullyScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const RegisterDoneSuccessfullyScreen(),
        );
      case AppRoutes.homeScreenRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return null;
    }
  }
}
