import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

abstract class ClientRemoteDatasource {
  Future<Either<Failure, ClientModel>> getClient(GetClientParams params);
}

class ClientRemoteDatasourceImpl implements ClientRemoteDatasource {
  final _collRef =
      FirebaseFirestore.instance.collection('client').withConverter(
            fromFirestore: ClientModel.fromFirestore,
            toFirestore: ClientModel.toFirestore,
          );

  @override
  Future<Either<Failure, ClientModel>> getClient(GetClientParams params) async {
    try {
      final doc = await _collRef.doc(params.uid).get();

      return Right(doc.data()!);
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }
}
