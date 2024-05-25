import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

class GetAllBannerUsecase extends UseCase<List<BannerAd>, NoParams> {
  final BannerRepository _repository;

  GetAllBannerUsecase(this._repository);

  @override
  Future<Either<Failure, List<BannerAd>>> call(params) =>
      _repository.getAllBanner();
}
