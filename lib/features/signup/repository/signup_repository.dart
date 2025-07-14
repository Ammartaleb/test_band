import 'package:test_band/core/network/api_client.dart';
import 'package:test_band/core/network/api_endpoints.dart';
import 'package:test_band/core/network/api_exception.dart';
import 'package:test_band/core/network/api_parameters/body_parameters.dart';
import 'package:test_band/features/signup/model/signup_response_model.dart';

class SignupRepository{
  final ApiClient apiClient;

  SignupRepository({required this.apiClient});

  Future<SignupResponseModel> signup({
    required SignupApiRequestBody requestBody,
  }) async {
    try {
      final response = await apiClient.post(
        endpoint: EndPoints.signupEndPoint,
        body: requestBody.toJson(),
      );

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