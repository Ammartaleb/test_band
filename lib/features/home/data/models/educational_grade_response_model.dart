class EducationalGradeModel {
  final int? id;
  final String? studentName;
  final String? grade;

  EducationalGradeModel({
    required this.id,
    required this.studentName,
    required this.grade,
  });

  factory EducationalGradeModel.fromJson(Map<String, dynamic> json) {
    return EducationalGradeModel(
      id: json['id'] as int?,
      studentName: json['studentName'] as String?,
      grade: json['grade'] as String?,
    );
  }
}

class EducationalGradeResponseModel {
  final List<EducationalGradeModel>? educationalGrades;
  EducationalGradeResponseModel({required this.educationalGrades});

  factory EducationalGradeResponseModel.fromJson(Map<String, dynamic> json) {
    var gradesJson = json['grades'] as List<dynamic>? ?? [];
    List<EducationalGradeModel> educationalGrades = gradesJson
        .map((g) => EducationalGradeModel.fromJson(g))
        .toList();

    return EducationalGradeResponseModel(educationalGrades: educationalGrades);
  }
}
