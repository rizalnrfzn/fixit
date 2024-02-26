import 'package:fixit/features/features.dart';

class StreamChatUsecase {
  final ChatRepository _repository;

  StreamChatUsecase(this._repository);

  Stream<List<Chat>> call(String idChat) => _repository.streamChat(idChat);
}
