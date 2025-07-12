part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  /// [GetBanners] api request states
  const factory HomeState.getBannersLoading() = GetBannersLoading;
  const factory HomeState.getBannersSuccess({
    required List<BannerEntity> banners,
  }) = GetBannersSuccess;
  const factory HomeState.getBannersFailed({required String message}) =
      GetBannersFailed;

  /// [GetEducationalGrades] api request states
  const factory HomeState.getEducationalGradesLoading() =
      GetEducationalGradesLoading;
  const factory HomeState.getEducationalGradesSuccess({
    required List<EducationalGradeEntity> educationalGrades,
  }) = GetEducationalGradesSuccess;
  const factory HomeState.getEducationalGradesFailed({
    required String message,
  }) = GetEducationalGradesFailed;

  /// [GetSubjects] api request states
  const factory HomeState.getSubjectsLoading() = GetSubjectsLoading;
  const factory HomeState.getSubjectsSuccess({
    required List<SubjectEntity> subjects,
  }) = GetSubjectsSuccess;
  const factory HomeState.getSubjectsFailed({required String message}) =
      GetSubjectsFailed;

  /// [GetTeachers] api request states
  const factory HomeState.getTeachersLoading() = GetTeachersLoading;
  const factory HomeState.getTeachersSuccess({
    required List<TeacherEntity> teachers,
  }) = GetTeachersSuccess;
  const factory HomeState.getTeachersFailed({required String message}) =
      GetTeachersFailed;
}
