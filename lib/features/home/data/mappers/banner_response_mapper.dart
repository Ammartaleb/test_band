import 'package:test_band/features/home/data/models/banner_response_model.dart';
import 'package:test_band/features/home/domain/entities/banner_response_entity.dart';

extension BannerMapper on BannerModel? {
  BannerEntity toEntity() {
    return BannerEntity(
      id: this?.id ?? 0,
      title: this?.title ?? "",
      imageUrl: this?.imageUrl ?? "",
    );
  }
}

extension BannerResponseMapper on BannerResponseModel? {
  BannerResponseEntity toEntity() {
    return BannerResponseEntity(
      banners: this?.banners?.map((banner) => banner.toEntity()).toList() ?? [],
    );
  }
}
