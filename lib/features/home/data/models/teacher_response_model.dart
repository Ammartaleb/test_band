class TeacherResponseModel {
  final List<TeacherModel>? teachers;
  TeacherResponseModel({required this.teachers});

  factory TeacherResponseModel.fromJson(Map<String, dynamic> json) {
    var teachersJson = json['teachers'] as List<dynamic>? ?? [];
    List<TeacherModel> teachersList = teachersJson
        .map((t) => TeacherModel.fromJson(t))
        .toList();

    return TeacherResponseModel(teachers: teachersList);
  }
}

class TeacherModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phoneNumber;

  TeacherModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );
  }
}
