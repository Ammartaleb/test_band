import 'package:test_band/core/networking/api_parameters/query_parameters.dart';
import 'package:test_band/core/usecases/usecase.dart';
import 'package:test_band/features/home/domain/entities/teacher_response_entity.dart';
import 'package:test_band/features/home/domain/repository/home_repository.dart';

class GetTeachersUseCase
    extends
        UseCase<TeacherResponseEntity, GetTeachersApiRequestQueryParameters> {
  final HomeRepository homeRepository;

  GetTeachersUseCase({required this.homeRepository});

  @override
  Future<TeacherResponseEntity> call(
    GetTeachersApiRequestQueryParameters params,
  ) async {
    return await homeRepository.getTeachers(queryParameters: params);
  }
}
