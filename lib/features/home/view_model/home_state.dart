part of 'home_cubit.dart';

class HomeState {
  final RequestStates bannersRequestStates;
  final List<BannerModel> banners;
  final String bannersFailureMessage;

  final RequestStates educationalGradesRequestStates;
  final List<EducationalGradeModel> educationalGrades;
  final String educationalGradesFailureMessage;

  final RequestStates subjectsRequestStates;
  final List<SubjectModel> subjects;
  final String subjectsFailureMessage;

  final RequestStates teachersRequestStates;
  final List<TeacherModel> teachers;
  final String teachersFailureMessage;

  HomeState({
    this.bannersRequestStates = RequestStates.loading,
    this.banners = const [],
    this.bannersFailureMessage = "",
    this.educationalGradesRequestStates = RequestStates.loading,
    this.educationalGrades = const [],
    this.educationalGradesFailureMessage = "",
    this.subjectsRequestStates = RequestStates.loading,
    this.subjects = const [],
    this.subjectsFailureMessage = "",
    this.teachersRequestStates = RequestStates.loading,
    this.teachers = const [],
    this.teachersFailureMessage = "",
  });

  HomeState copyWith({
    RequestStates? bannersRequestStates,
    List<BannerModel>? banners,
    String? bannersFailureMessage,
    RequestStates? educationalGradesRequestStates,
    List<EducationalGradeModel>? educationalGrades,
    String? educationalGradesFailureMessage,
    RequestStates? subjectsRequestStates,
    List<SubjectModel>? subjects,
    String? subjectsFailureMessage,
    RequestStates? teachersRequestStates,
    List<TeacherModel>? teachers,
    String? teachersFailureMessage,
  }) {
    return HomeState(
      bannersRequestStates: bannersRequestStates ?? this.bannersRequestStates,
      banners: banners ?? this.banners,
      bannersFailureMessage:
          bannersFailureMessage ?? this.bannersFailureMessage,
      educationalGradesRequestStates:
          educationalGradesRequestStates ?? this.educationalGradesRequestStates,
      educationalGrades: educationalGrades ?? this.educationalGrades,
      educationalGradesFailureMessage:
          educationalGradesFailureMessage ??
          this.educationalGradesFailureMessage,
      subjectsRequestStates:
          subjectsRequestStates ?? this.subjectsRequestStates,
      subjects: subjects ?? this.subjects,
      subjectsFailureMessage:
          subjectsFailureMessage ?? this.subjectsFailureMessage,
      teachersRequestStates:
          teachersRequestStates ?? this.teachersRequestStates,
      teachers: teachers ?? this.teachers,
      teachersFailureMessage:
          teachersFailureMessage ?? this.teachersFailureMessage,
    );
  }
}
