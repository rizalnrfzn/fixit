import 'package:dartz/dartz.dart';
import 'package:fixit/core/error/failure.dart';
import 'package:fixit/features/features.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerRemoteDatasource _datasource;

  BannerRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, List<BannerAd>>> getAllBanner() async {
    final response = await _datasource.getAllBanner();

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => e.toEntity()).toList()),
    );
  }
}
