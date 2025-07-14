class BannerResponseModel {
  final List<BannerModel>? banners;

  BannerResponseModel({required this.banners});

  factory BannerResponseModel.fromJson(Map<String, dynamic> json) {
    var bannersJson = json['banners'] as List<dynamic>? ?? [];
    List<BannerModel> bannersList = bannersJson
        .map((bannerJson) => BannerModel.fromJson(bannerJson))
        .toList();

    return BannerResponseModel(banners: bannersList);
  }
}

class BannerModel {
  final int? id;
  final String? title;
  final String? imageUrl;

  BannerModel({required this.id, required this.title, required this.imageUrl});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );
  }
}
