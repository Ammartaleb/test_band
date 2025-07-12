import 'package:test_band/core/networking/api_exception.dart';
import 'package:test_band/core/networking/api_parameters/query_parameters.dart';
import 'package:test_band/features/home/data/datasources/home_remote_datasource.dart';
import 'package:test_band/features/home/data/mappers/banner_response_mapper.dart';
import 'package:test_band/features/home/data/mappers/educational_grade_response_mapper.dart';
import 'package:test_band/features/home/data/mappers/subject_response_mapper.dart';
import 'package:test_band/features/home/data/mappers/teacher_response_mapper.dart';
import 'package:test_band/features/home/domain/entities/banner_response_entity.dart';
import 'package:test_band/features/home/domain/entities/educational_grade_response_entity.dart';
import 'package:test_band/features/home/domain/entities/subject_response_entity.dart';
import 'package:test_band/features/home/domain/entities/teacher_response_entity.dart';
import 'package:test_band/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<BannerResponseEntity> getBanners() async {
    try {
      final response = await homeRemoteDataSource.getBanners();
      return response.toEntity();
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<EducationalGradeResponseEntity> getEducationalGrades() async {
    try {
      final response = await homeRemoteDataSource.getEducationalGrades();
      return response.toEntity();
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<SubjectResponseEntity> getSubjects({
    required GetSubjectsApiRequestQueryParameters queryParameters,
  }) async {
    try {
      final response = await homeRemoteDataSource.getSubjects(
        queryParameters: queryParameters,
      );
      return response.toEntity();
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<TeacherResponseEntity> getTeachers({
    required GetTeachersApiRequestQueryParameters queryParameters,
  }) async {
    try {
      final response = await homeRemoteDataSource.getTeachers(
        queryParameters: queryParameters,
      );
      return response.toEntity();
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
