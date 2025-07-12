import 'package:test_band/core/networking/api_parameters/query_parameters.dart';
import 'package:test_band/features/home/domain/entities/banner_response_entity.dart';
import 'package:test_band/features/home/domain/entities/educational_grade_response_entity.dart';
import 'package:test_band/features/home/domain/entities/subject_response_entity.dart';
import 'package:test_band/features/home/domain/entities/teacher_response_entity.dart';

abstract class HomeRepository {
  Future<EducationalGradeResponseEntity> getEducationalGrades();
  Future<BannerResponseEntity> getBanners();
  Future<SubjectResponseEntity> getSubjects({
    required GetSubjectsApiRequestQueryParameters queryParameters,
  });
  Future<TeacherResponseEntity> getTeachers({
    required GetTeachersApiRequestQueryParameters queryParameters,
  });
}
