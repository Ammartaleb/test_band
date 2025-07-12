import 'package:test_band/core/networking/api_parameters/query_parameters.dart';
import 'package:test_band/core/usecases/usecase.dart';
import 'package:test_band/features/home/domain/entities/subject_response_entity.dart';
import 'package:test_band/features/home/domain/repository/home_repository.dart';

class GetSubjectsByEducationalGradesUseCase
    extends
        UseCase<SubjectResponseEntity, GetSubjectsApiRequestQueryParameters> {
  final HomeRepository homeRepository;

  GetSubjectsByEducationalGradesUseCase({required this.homeRepository});

  @override
  Future<SubjectResponseEntity> call(
    GetSubjectsApiRequestQueryParameters params,
  ) async {
    return await homeRepository.getSubjects(queryParameters: params);
  }
}
