import 'package:test_band/features/auth/data/models/signup_response_model.dart';
import 'package:test_band/features/auth/domain/entities/signup_response_entity.dart';

extension SignupResponseMapper on SignupResponseModel? {
  SignupResponseEntity toEntity() {
    return SignupResponseEntity(token: this?.token ?? "");
  }
}
