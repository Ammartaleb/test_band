import 'dart:convert';

import 'package:test_band/core/networking/api_client.dart';
import 'package:test_band/core/networking/api_endpoints.dart';
import 'package:test_band/core/networking/api_exception.dart';
import 'package:test_band/core/networking/api_parameters/query_parameters.dart';
import 'package:test_band/features/home/data/models/banner_response_model.dart';
import 'package:test_band/features/home/data/models/educational_grade_response_model.dart';
import 'package:test_band/features/home/data/models/subject_response_model.dart';
import 'package:test_band/features/home/data/models/teacher_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<EducationalGradeResponseModel> getEducationalGrades();
  Future<BannerResponseModel> getBanners();
  Future<SubjectResponseModel> getSubjects({
    required GetSubjectsApiRequestQueryParameters queryParameters,
  });
  Future<TeacherResponseModel> getTeachers({
    required GetTeachersApiRequestQueryParameters queryParameters,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteDataSourceImpl({required this.apiClient});

  @override
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

  @override
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

  @override
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

  @override
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
