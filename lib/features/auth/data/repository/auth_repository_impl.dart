import 'package:test_band/core/networking/api_exception.dart';
import 'package:test_band/core/networking/api_parameters/body_parameters.dart';
import 'package:test_band/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:test_band/features/auth/data/mappers/login_response_mapper.dart';
import 'package:test_band/features/auth/data/mappers/signup_response_mapper.dart';
import 'package:test_band/features/auth/domain/entities/login_response_entity.dart';
import 'package:test_band/features/auth/domain/entities/signup_response_entity.dart';
import 'package:test_band/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<LoginResponseEntity> login({
    required LoginApiRequestBody requestBody,
  }) async {
    try {
      final response = await authRemoteDataSource.login(
        requestBody: requestBody,
      );
      return response.toEntity();
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<SignupResponseEntity> signup({
    required SignupApiRequestBody requestBody,
  }) async {
    try {
      final response = await authRemoteDataSource.signup(
        requestBody: requestBody,
      );
      return response.toEntity();
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
