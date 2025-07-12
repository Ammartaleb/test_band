import 'package:test_band/features/auth/data/models/login_response_model.dart';
import 'package:test_band/features/auth/domain/entities/login_response_entity.dart';

extension LoginResponseMapper on LoginResponseModel? {
  LoginResponseEntity toEntity() {
    return LoginResponseEntity(token: this?.token ?? "");
  }
}
