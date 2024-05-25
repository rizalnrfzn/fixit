import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

abstract class ClientRepository {
  Future<Either<Failure, Client>> getClient(GetClientParams params);
}
