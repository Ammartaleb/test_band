class SubjectResponseEntity {
  final List<SubjectEntity> subjects;

  SubjectResponseEntity({required this.subjects});
}

class SubjectEntity {
  final int id;
  final String name;

  SubjectEntity({
    required this.id,
    required this.name,
  });
}
