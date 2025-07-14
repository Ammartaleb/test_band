import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:test_band/core/helpers/app_validators.dart';
import 'package:test_band/core/helpers/location_helper.dart';
import 'package:test_band/core/helpers/token_storage.dart';
import 'package:test_band/core/network/api_client.dart';
import 'package:test_band/features/home/repository/home_repository.dart';
import 'package:test_band/features/home/view_model/home_cubit.dart';
import 'package:test_band/features/login/repository/login_repository.dart';
import 'package:test_band/features/login/view_model/login_cubit.dart';
import 'package:test_band/features/signup/repository/signup_repository.dart';
import 'package:test_band/features/signup/view_model/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  /// Injecting [SecureStorage]
  const flutterSecureStorage = FlutterSecureStorage();
  getIt.registerLazySingleton(() => flutterSecureStorage);

  /// Injecting [TokenStorage]
  getIt.registerLazySingleton(() => TokenStorage());

  /// Injecting [ApiClient]
  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(tokenStorage: getIt()),
  );

  /// Injecting [AppValidators]
  getIt.registerLazySingleton<AppValidators>(() => AppValidators());

  /// Injecting [LocationHelper]
  getIt.registerLazySingleton<LocationHelper>(() => LocationHelper());

  /// Injecting [FirebaseMessaging]
  getIt.registerLazySingleton(() => FirebaseMessaging.instance);

  /// Injecting [Repository]
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepository(apiClient: getIt()),
  );
  getIt.registerLazySingleton<SignupRepository>(
    () => SignupRepository(apiClient: getIt()),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepository(apiClient: getIt()),
  );

  /// Injecting [BLoC]
  getIt.registerFactory<LoginCubit>(() => LoginCubit(loginRepository: getIt()));
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(signupRepository: getIt()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(homeRepository: getIt()));
}
