import 'package:test_band/features/home/data/models/subject_response_model.dart';
import 'package:test_band/features/home/domain/entities/subject_response_entity.dart';

extension SubjectMapper on SubjectModel? {
  SubjectEntity toEntity() {
    return SubjectEntity(
      id: this?.id ?? 0,
      name: this?.name ?? "",
    );
  }
}

extension SubjectResponseMapper on SubjectResponseModel? {
  SubjectResponseEntity toEntity() {
    return SubjectResponseEntity(
      subjects: this?.subjects?.map((subject) => subject.toEntity()).toList() ?? [],
    );
  }
}
