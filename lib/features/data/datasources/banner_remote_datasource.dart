import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

abstract class BannerRemoteDatasource {
  Future<Either<Failure, List<BannerAdModel>>> getAllBanner();
}

class BannerRemoteDatasourceImpl implements BannerRemoteDatasource {
  final _collRef =
      FirebaseFirestore.instance.collection('banner').withConverter(
            fromFirestore: BannerAdModel.fromFirestore,
            toFirestore: BannerAdModel.toFirestore,
          );

  @override
  Future<Either<Failure, List<BannerAdModel>>> getAllBanner() async {
    try {
      final query = await _collRef.get();

      final listData = query.docs.map((e) => e.data()).toList();

      return Right(listData);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.message!));
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }
}
