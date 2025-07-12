class EducationalGradeResponseEntity {
  final List<EducationalGradeEntity> educationalGrades;

  EducationalGradeResponseEntity({required this.educationalGrades});
}

class EducationalGradeEntity {
  final int id;
  final String studentName;
  final String grade;

  EducationalGradeEntity({
    required this.id,
    required this.studentName,
    required this.grade,
  });
}
