import 'package:fixit/features/features.dart';

class StreamChatListUsecase {
  final ChatRepository _repository;

  StreamChatListUsecase(this._repository);

  Stream<List<ChatList>> call(String uid) => _repository.streamChatList(uid);
}
