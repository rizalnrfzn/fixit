import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/domain/domain.dart';

class ReadChatUsecase extends UseCase<ChatList, ChatList> {
  final ChatRepository _repository;

  ReadChatUsecase(this._repository);

  @override
  Future<Either<Failure, ChatList>> call(ChatList params) =>
      _repository.readChat(params);
}
