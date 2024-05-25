import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/domain/domain.dart';

class NewChatUsecase extends UseCase<ChatList, String> {
  final ChatRepository _repository;

  NewChatUsecase(this._repository);

  @override
  Future<Either<Failure, ChatList>> call(String params) =>
      _repository.newChatList(params);
}
