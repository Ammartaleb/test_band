import 'package:test_band/core/networking/api_exception.dart';
import 'package:test_band/core/networking/api_parameters/body_parameters.dart';
import 'package:test_band/core/usecases/usecase.dart';
import 'package:test_band/features/auth/domain/entities/login_response_entity.dart';
import 'package:test_band/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase extends UseCase<LoginResponseEntity, LoginApiRequestBody> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<LoginResponseEntity> call(LoginApiRequestBody params) async {
    try {
      final response = await authRepository.login(requestBody: params);
      return response;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
