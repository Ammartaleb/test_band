import 'package:test_band/core/usecases/usecase.dart';
import 'package:test_band/features/home/domain/entities/banner_response_entity.dart';
import 'package:test_band/features/home/domain/repository/home_repository.dart';

class GetBannersUseCase extends UseCase<BannerResponseEntity, NoParams> {
  final HomeRepository homeRepository;

  GetBannersUseCase({required this.homeRepository});
  
  @override
  Future<BannerResponseEntity> call(NoParams params) async {
    return await homeRepository.getBanners();
  }
}
