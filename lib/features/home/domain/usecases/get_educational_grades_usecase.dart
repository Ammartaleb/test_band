import 'package:test_band/core/usecases/usecase.dart';
import 'package:test_band/features/home/domain/entities/educational_grade_response_entity.dart';
import 'package:test_band/features/home/domain/repository/home_repository.dart';

class GetEducationalGradesUseCase extends UseCase<EducationalGradeResponseEntity, NoParams> {
  final HomeRepository homeRepository;

  GetEducationalGradesUseCase({required this.homeRepository});
  
  @override
  Future<EducationalGradeResponseEntity> call(NoParams params) async {
    return await homeRepository.getEducationalGrades();
  }
}