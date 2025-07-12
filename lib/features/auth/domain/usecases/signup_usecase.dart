import 'package:test_band/core/networking/api_exception.dart';
import 'package:test_band/core/networking/api_parameters/body_parameters.dart';
import 'package:test_band/core/usecases/usecase.dart';
import 'package:test_band/features/auth/domain/entities/signup_response_entity.dart';
import 'package:test_band/features/auth/domain/repository/auth_repository.dart';

class SignupUseCase extends UseCase<SignupResponseEntity, SignupApiRequestBody> {
  final AuthRepository authRepository;

  SignupUseCase({required this.authRepository});

  @override
  Future<SignupResponseEntity> call(SignupApiRequestBody params) async {
    try {
      final response = await authRepository.signup(requestBody: params);
      return response;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
