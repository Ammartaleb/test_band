class EndPoints {
  static const String baseUrl = "https://e-learning.testbandtech.com/student";

  /// [Auth] end points
  static const String loginEndPoint = "$baseUrl/auth/login";
  static const String signupEndPoint = "$baseUrl/auth/register";

  /// [Home] end points
  static const String getEducationalGradesEndPoint =
      "$baseUrl/educational-grade";
  static const String getAdvertisementBannersEndPoint =
      "$baseUrl/advertisement";
  static const String getSubjectByEducationalGradeEndPoint =
      "$baseUrl/subject/by-educational-grade";
  static const String getTeachersEndPoint = "$baseUrl/teacher/filter-teacher";
}
