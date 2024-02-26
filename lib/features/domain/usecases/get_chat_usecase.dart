import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

class GetChatUsecase extends UseCase<List<Chat>, String> {
  final ChatRepository _repository;

  GetChatUsecase(this._repository);

  @override
  Future<Either<Failure, List<Chat>>> call(String params) =>
      _repository.getChat(params);
}
