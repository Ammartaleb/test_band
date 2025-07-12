import 'package:test_band/features/home/data/models/teacher_response_model.dart';
import 'package:test_band/features/home/domain/entities/teacher_response_entity.dart';

extension TeacherMapper on TeacherModel? {
  TeacherEntity toEntity() {
    return TeacherEntity(
      id: this?.id ?? 0,
      name: this?.name ?? "",
      email: this?.email ?? "",
      phoneNumber: this?.phoneNumber ?? "",
    );
  }
}

extension TeacherResponseMapper on TeacherResponseModel? {
  TeacherResponseEntity toEntity() {
    return TeacherResponseEntity(
      teachers:
          this?.teachers?.map((teacher) => teacher.toEntity()).toList() ?? [],
    );
  }
}
