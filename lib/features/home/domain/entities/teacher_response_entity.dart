class TeacherResponseEntity {
  final List<TeacherEntity> teachers;

  TeacherResponseEntity({required this.teachers});
}

class TeacherEntity {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;

  TeacherEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
}
