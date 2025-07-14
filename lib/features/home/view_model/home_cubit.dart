import 'package:bloc/bloc.dart';
import 'package:test_band/core/enums/enums.dart';
import 'package:test_band/core/network/api_exception.dart';
import 'package:test_band/core/network/api_parameters/query_parameters.dart';
import 'package:test_band/features/home/model/banner_response_model.dart';
import 'package:test_band/features/home/model/educational_grade_response_model.dart';
import 'package:test_band/features/home/model/subject_response_model.dart';
import 'package:test_band/features/home/model/teacher_response_model.dart';
import 'package:test_band/features/home/repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit({required this.homeRepository}) : super(HomeState());

  getEducationalGrades() async {
    emit(state.copyWith(educationalGradesRequestStates: RequestStates.loading));
    try {
      final response = await homeRepository.getEducationalGrades();
      emit(
        state.copyWith(
          educationalGrades: response.educationalGrades,
          educationalGradesRequestStates: RequestStates.success,
        ),
      );
    } on ServerException catch (e) {
      emit(
        state.copyWith(
          educationalGradesFailureMessage: e.message,
          educationalGradesRequestStates: RequestStates.failed,
        ),
      );
    }
  }

  getBanners() async {
    emit(state.copyWith(bannersRequestStates: RequestStates.loading));
    try {
      final response = await homeRepository.getBanners();
      emit(
        state.copyWith(
          banners: response.banners,
          bannersRequestStates: RequestStates.success,
        ),
      );
    } on ServerException catch (e) {
      emit(
        state.copyWith(
          bannersFailureMessage: e.message,
          bannersRequestStates: RequestStates.failed,
        ),
      );
    }
  }

  getSubjects({
    required GetSubjectsApiRequestQueryParameters queryParameters,
  }) async {
    emit(state.copyWith(subjectsRequestStates: RequestStates.loading));
    try {
      final response = await homeRepository.getSubjects(
        queryParameters: queryParameters,
      );
      emit(
        state.copyWith(
          subjectsRequestStates: RequestStates.success,
          subjects: response.subjects,
        ),
      );
    } on ServerException catch (e) {
      emit(
        state.copyWith(
          subjectsRequestStates: RequestStates.failed,
          subjectsFailureMessage: e.message,
        ),
      );
    }
  }

  getTeachers({
    required GetTeachersApiRequestQueryParameters queryParameters,
  }) async {
    emit(state.copyWith(teachersRequestStates: RequestStates.loading));
    try {
      final response = await homeRepository.getTeachers(
        queryParameters: queryParameters,
      );
      emit(
        state.copyWith(
          teachersRequestStates: RequestStates.success,
          teachers: response.teachers,
        ),
      );
    } on ServerException catch (e) {
      emit(
        state.copyWith(
          teachersRequestStates: RequestStates.failed,
          teachersFailureMessage: e.message,
        ),
      );
    }
  }
}
