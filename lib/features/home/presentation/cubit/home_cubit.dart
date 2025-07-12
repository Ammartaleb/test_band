import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_band/core/networking/api_exception.dart';
import 'package:test_band/core/networking/api_parameters/query_parameters.dart';
import 'package:test_band/core/usecases/usecase.dart';
import 'package:test_band/features/home/domain/entities/banner_response_entity.dart';
import 'package:test_band/features/home/domain/entities/educational_grade_response_entity.dart';
import 'package:test_band/features/home/domain/entities/subject_response_entity.dart';
import 'package:test_band/features/home/domain/entities/teacher_response_entity.dart';
import 'package:test_band/features/home/domain/usecases/get_banners_usecase.dart';
import 'package:test_band/features/home/domain/usecases/get_educational_grades_usecase.dart';
import 'package:test_band/features/home/domain/usecases/get_subjects_by_educational_grades_usecase.dart';
import 'package:test_band/features/home/domain/usecases/get_teachers_usecase.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetBannersUseCase getBannersUseCase;
  final GetEducationalGradesUseCase getEducationalGradesUseCase;
  final GetSubjectsByEducationalGradesUseCase
  getSubjectsByEducationalGradesUseCase;
  final GetTeachersUseCase getTeachersUseCase;

  HomeCubit({
    required this.getBannersUseCase,
    required this.getEducationalGradesUseCase,
    required this.getSubjectsByEducationalGradesUseCase,
    required this.getTeachersUseCase,
  }) : super(const HomeState.initial());

  getEducationalGrades() async {
    emit(const HomeState.getEducationalGradesLoading());
    try {
      final response = await getEducationalGradesUseCase(const NoParams());
      emit(
        HomeState.getEducationalGradesSuccess(
          educationalGrades: response.educationalGrades,
        ),
      );
    } on ServerException catch (e) {
      emit(HomeState.getEducationalGradesFailed(message: e.message));
    }
  }

  getBanners() async {
    emit(const HomeState.getBannersLoading());
    try {
      final response = await getBannersUseCase(const NoParams());
      emit(HomeState.getBannersSuccess(banners: response.banners));
    } on ServerException catch (e) {
      emit(HomeState.getBannersFailed(message: e.message));
    }
  }

  getSubjects({
    required GetSubjectsApiRequestQueryParameters queryParameters,
  }) async {
    emit(const HomeState.getSubjectsLoading());
    try {
      final response = await getSubjectsByEducationalGradesUseCase(
        queryParameters,
      );
      emit(HomeState.getSubjectsSuccess(subjects: response.subjects));
    } on ServerException catch (e) {
      emit(HomeState.getSubjectsFailed(message: e.message));
    }
  }

  getTeachers({
    required GetTeachersApiRequestQueryParameters queryParameters,
  }) async {
    emit(const HomeState.getTeachersLoading());
    try {
      final response = await getTeachersUseCase(queryParameters);
      emit(HomeState.getTeachersSuccess(teachers: response.teachers));
    } on ServerException catch (e) {
      emit(HomeState.getTeachersFailed(message: e.message));
    }
  }
}
