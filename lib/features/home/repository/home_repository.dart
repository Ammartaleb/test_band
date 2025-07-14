import 'dart:convert';

import 'package:test_band/core/network/api_client.dart';
import 'package:test_band/core/network/api_endpoints.dart';
import 'package:test_band/core/network/api_exception.dart';
import 'package:test_band/core/network/api_parameters/query_parameters.dart';
import 'package:test_band/features/home/model/banner_response_model.dart';
import 'package:test_band/features/home/model/educational_grade_response_model.dart';
import 'package:test_band/features/home/model/subject_response_model.dart';
import 'package:test_band/features/home/model/teacher_response_model.dart';

class HomeRepository {
  final ApiClient apiClient;

  const HomeRepository({required this.apiClient});

  Future<BannerResponseModel> getBanners() async {
    try {
      final response = await apiClient.get(
        endpoint: EndPoints.getAdvertisementBannersEndPoint,
      );

      if (response.statusCode != 200) {
        final decodedBody = jsonDecode(response.body);
        throw BannerResponseModel.fromJson(decodedBody);
      } else {
        throw ServerException(
          message: "Failed to get banners , please try again",
        );
      }
    } catch (_) {
      throw ServerException(
        message: "An error occurred while get banneres , please try again",
      );
    }
  }

  Future<EducationalGradeResponseModel> getEducationalGrades() async {
    try {
      final response = await apiClient.get(
        endpoint: EndPoints.getEducationalGradesEndPoint,
      );

      if (response.statusCode != 200) {
        final decodedBody = jsonDecode(response.body);
        throw EducationalGradeResponseModel.fromJson(decodedBody);
      } else {
        throw ServerException(
          message: "Failed to get educational grades , please try again",
        );
      }
    } catch (_) {
      throw ServerException(
        message:
            "An error occurred while get educational grades , please try again",
      );
    }
  }

  Future<SubjectResponseModel> getSubjects({
    required GetSubjectsApiRequestQueryParameters queryParameters,
  }) async {
    String getSubjectsEndPointWithQueryParameters =
        "${EndPoints.getSubjectByEducationalGradeEndPoint}?educational_grade_id=${queryParameters.educationalGradeId}";
    try {
      final response = await apiClient.get(
        endpoint: getSubjectsEndPointWithQueryParameters,
      );

      if (response.statusCode != 200) {
        final decodedBody = jsonDecode(response.body);
        throw SubjectResponseModel.fromJson(decodedBody);
      } else {
        throw ServerException(
          message: "Failed to get subjects , please try again",
        );
      }
    } catch (_) {
      throw ServerException(
        message: "An error occurred while get subjects , please try again",
      );
    }
  }

  Future<TeacherResponseModel> getTeachers({
    required GetTeachersApiRequestQueryParameters queryParameters,
  }) async {
    String getTeachersEndPointWithQueryParameters =
        "${EndPoints.getTeachersEndPoint}?educational_grade_id=${queryParameters.educationalGradeId}&subject_id=${queryParameters.subjectId}";
    try {
      final response = await apiClient.get(
        endpoint: getTeachersEndPointWithQueryParameters,
      );

      if (response.statusCode != 200) {
        final decodedBody = jsonDecode(response.body);
        throw TeacherResponseModel.fromJson(decodedBody);
      } else {
        throw ServerException(
          message: "Failed to get subjects , please try again",
        );
      }
    } catch (_) {
      throw ServerException(
        message: "An error occurred while get subjects , please try again",
      );
    }
  }
}
