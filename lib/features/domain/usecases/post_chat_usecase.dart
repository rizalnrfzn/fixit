import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

class PostChatUsecase extends UseCase<Chat, PostChatParams> {
  final ChatRepository _repository;

  PostChatUsecase(this._repository);

  @override
  Future<Either<Failure, Chat>> call(PostChatParams params) =>
      _repository.postChat(params);
}

class PostChatParams {
  final Chat chat;
  final ChatList chatList;

  PostChatParams({
    required this.chat,
    required this.chatList,
  });
}
