import 'dart:convert';

import 'package:test_band/core/networking/api_client.dart';
import 'package:test_band/core/networking/api_endpoints.dart';
import 'package:test_band/core/networking/api_exception.dart';
import 'package:test_band/core/networking/api_parameters/body_parameters.dart';
import 'package:test_band/features/auth/data/models/login_response_model.dart';
import 'package:test_band/features/auth/data/models/signup_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login({required LoginApiRequestBody requestBody});
  Future<SignupResponseModel> signup({
    required SignupApiRequestBody requestBody,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<LoginResponseModel> login({
    required LoginApiRequestBody requestBody,
  }) async {
    try {
      final response = await apiClient.post(
        endpoint: EndPoints.loginEndPoint,
        body: requestBody.toJson(),
      );

      print("the response is ${jsonDecode(response.body)}");

      if (response.statusCode != 200) {
        throw ServerException(message: 'Failed to create user');
      } else {
        throw ServerException(message: "Failed to login , please try again");
      }
    } catch (_) {
      throw ServerException(
        message: "An error occurred while login , please try again",
      );
    }
  }

  @override
  Future<SignupResponseModel> signup({
    required SignupApiRequestBody requestBody,
  }) async {
    try {
      final response = await apiClient.post(
        endpoint: EndPoints.signupEndPoint,
        body: requestBody.toJson(),
      );

      print("the response is ${jsonDecode(response.body)}");

      if (response.statusCode != 201) {
        throw ServerException(message: 'Failed to create user');
      } else {
        throw ServerException(message: "Failed to signup , please try again");
      }
    } catch (_) {
      throw ServerException(
        message: "An error occurred while signup , please try again",
      );
    }
  }
}
