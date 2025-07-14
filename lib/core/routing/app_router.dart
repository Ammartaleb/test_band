import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/di/dependency_injection.dart';
import 'package:test_band/features/home/view_model/home_cubit.dart';
import 'package:test_band/features/login/view/screens/login_screen.dart';
import 'package:test_band/features/login/view_model/login_cubit.dart';
import 'package:test_band/features/signup/view/screens/register_done_successfully_screen.dart';
import 'package:test_band/features/signup/view/screens/signup_screen.dart';
import 'package:test_band/features/home/view/screens/home_screen.dart';
import 'package:test_band/features/signup/view_model/signup_cubit.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}

class AppRoutes {
  static const String loginScreenRoute = "/";
  static const String signupScreenRoute = "/signup";
  static const String registerDoneSuccessfullyScreenRoute =
      "/register_done_successfully";
  static const String homeScreenRoute = "/home";
}

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case AppRoutes.signupScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case AppRoutes.registerDoneSuccessfullyScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const RegisterDoneSuccessfullyScreen(),
        );
      case AppRoutes.homeScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..getEducationalGrades(),
            child: const HomeScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
