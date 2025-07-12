import 'package:test_band/core/networking/api_parameters/body_parameters.dart';
import 'package:test_band/features/auth/domain/entities/login_response_entity.dart';
import 'package:test_band/features/auth/domain/entities/signup_response_entity.dart';

abstract class AuthRepository {
  Future<LoginResponseEntity> login({required LoginApiRequestBody requestBody});
  Future<SignupResponseEntity> signup({
    required SignupApiRequestBody requestBody,
  });
}
