import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/domain/entities/banner_ad.dart';

abstract class BannerRepository {
  Future<Either<Failure, List<BannerAd>>> getAllBanner();
}
