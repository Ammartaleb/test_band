import 'package:test_band/core/network/api_client.dart';
import 'package:test_band/core/network/api_endpoints.dart';
import 'package:test_band/core/network/api_exception.dart';
import 'package:test_band/core/network/api_parameters/body_parameters.dart';
import 'package:test_band/features/login/model/login_response_model.dart';

class LoginRepository{
  final ApiClient apiClient;

  LoginRepository({required this.apiClient});

  Future<LoginResponseModel> login({
    required LoginApiRequestBody requestBody,
  }) async {
    try {
      final response = await apiClient.post(
        endpoint: EndPoints.loginEndPoint,
        body: requestBody.toJson(),
      );

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
}