import 'package:test_band/features/home/data/models/educational_grade_response_model.dart';
import 'package:test_band/features/home/domain/entities/educational_grade_response_entity.dart';

extension EducationalGradeMapper on EducationalGradeModel? {
  EducationalGradeEntity toEntity() {
    return EducationalGradeEntity(
      id: this?.id ?? 0,
      studentName: this?.studentName ?? "",
      grade: this?.grade ?? "",
    );
  }
}

extension EducationalGradeResponseMapper on EducationalGradeResponseModel? {
  EducationalGradeResponseEntity toEntity() {
    return EducationalGradeResponseEntity(
      educationalGrades:
          this?.educationalGrades?.map((grade) => grade.toEntity()).toList() ??
          [],
    );
  }
}
