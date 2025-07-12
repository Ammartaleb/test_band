import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:test_band/core/helpers/app_validators.dart';
import 'package:test_band/core/helpers/location_helper.dart';
import 'package:test_band/core/helpers/token_storage.dart';
import 'package:test_band/core/networking/api_client.dart';
import 'package:test_band/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:test_band/features/auth/data/repository/auth_repository_impl.dart';
import 'package:test_band/features/auth/domain/repository/auth_repository.dart';
import 'package:test_band/features/auth/domain/usecases/login_usecase.dart';
import 'package:test_band/features/auth/domain/usecases/signup_usecase.dart';
import 'package:test_band/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:test_band/features/home/data/datasources/home_remote_datasource.dart';
import 'package:test_band/features/home/data/repository/home_repository_impl.dart';
import 'package:test_band/features/home/domain/repository/home_repository.dart';
import 'package:test_band/features/home/domain/usecases/get_banners_usecase.dart';
import 'package:test_band/features/home/domain/usecases/get_educational_grades_usecase.dart';
import 'package:test_band/features/home/domain/usecases/get_subjects_by_educational_grades_usecase.dart';
import 'package:test_band/features/home/domain/usecases/get_teachers_usecase.dart';
import 'package:test_band/features/home/presentation/cubit/home_cubit.dart';

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

  /// Injecting [DataSources]
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiClient: getIt()),
  );
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiClient: getIt()),
  );

  /// Injecting [Repository]
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(homeRemoteDataSource: getIt()),
  );

  /// Injecting [UseCases]
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(authRepository: getIt()),
  );
  getIt.registerLazySingleton<SignupUseCase>(
    () => SignupUseCase(authRepository: getIt()),
  );
  getIt.registerLazySingleton<GetBannersUseCase>(
    () => GetBannersUseCase(homeRepository: getIt()),
  );
  getIt.registerLazySingleton<GetEducationalGradesUseCase>(
    () => GetEducationalGradesUseCase(homeRepository: getIt()),
  );
  getIt.registerLazySingleton<GetSubjectsByEducationalGradesUseCase>(
    () => GetSubjectsByEducationalGradesUseCase(homeRepository: getIt()),
  );
  getIt.registerLazySingleton<GetTeachersUseCase>(
    () => GetTeachersUseCase(homeRepository: getIt()),
  );

  /// Injecting [StateManagement]
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(loginUseCase: getIt(), signupUseCase: getIt()),
  );
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      getBannersUseCase: getIt(),
      getEducationalGradesUseCase: getIt(),
      getSubjectsByEducationalGradesUseCase: getIt(),
      getTeachersUseCase: getIt(),
    ),
  );
}
