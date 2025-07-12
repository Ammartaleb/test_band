class BannerResponseEntity {
  final List<BannerEntity> banners;

  BannerResponseEntity({required this.banners});
}

class BannerEntity {
  final int id;
  final String title;
  final String imageUrl;

  BannerEntity({required this.id, required this.title, required this.imageUrl});
}
