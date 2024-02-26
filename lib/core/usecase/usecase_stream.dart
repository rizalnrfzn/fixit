import 'package:dartz/dartz.dart';

import '../core.dart';

abstract class UseCaseStream<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}
