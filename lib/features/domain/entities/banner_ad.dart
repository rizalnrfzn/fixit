import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_ad.freezed.dart';

@freezed
class BannerAd with _$BannerAd {
  factory BannerAd({
    String? id,
    String? description,
    String? image,
    String? routes,
  }) = _BannerAd;

  BannerAd._();
}
