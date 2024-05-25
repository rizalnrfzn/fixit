import 'package:dartz/dartz.dart';
import 'package:fixit/core/error/failure.dart';
import 'package:fixit/features/features.dart';

class ClientRepositoryImpl implements ClientRepository {
  final ClientRemoteDatasource datasource;

  ClientRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Client>> getClient(GetClientParams params) async {
    final response = await datasource.getClient(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }
}
