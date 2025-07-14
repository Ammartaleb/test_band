class GetSubjectsApiRequestQueryParameters {
  final String educationalGradeId;

  GetSubjectsApiRequestQueryParameters({required this.educationalGradeId});
}

class GetTeachersApiRequestQueryParameters {
  final String educationalGradeId;
  final String subjectId;

  GetTeachersApiRequestQueryParameters({
    required this.educationalGradeId,
    required this.subjectId,
  });
}
