class SubjectResponseModel {
  final List<SubjectModel>? subjects;

  SubjectResponseModel({required this.subjects});

  factory SubjectResponseModel.fromJson(Map<String, dynamic> json) {
    var subjectsJson = json['subjects'] as List<dynamic>? ?? [];
    List<SubjectModel> subjects = subjectsJson
        .map((s) => SubjectModel.fromJson(s))
        .toList();

    return SubjectResponseModel(subjects: subjects);
  }
}

class SubjectModel {
  final int? id;
  final String? name;

  SubjectModel({
    required this.id,
    required this.name,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
  }
}
