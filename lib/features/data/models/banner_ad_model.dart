import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_ad_model.freezed.dart';
part 'banner_ad_model.g.dart';

@freezed
class BannerAdModel with _$BannerAdModel {
  factory BannerAdModel({
    String? id,
    String? description,
    String? image,
    String? routes,
  }) = _BannerAdModel;

  BannerAdModel._();

  factory BannerAdModel.fromJson(Map<String, dynamic> json) =>
      _$BannerAdModelFromJson(json);

  factory BannerAdModel.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? options) =>
      BannerAdModel.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, dynamic> toFirestore(
          BannerAdModel bannerAdModel, SetOptions? options) =>
      bannerAdModel.toJson();

  BannerAd toEntity() => BannerAd(
        id: id,
        description: description,
        image: image,
        routes: routes,
      );
}
