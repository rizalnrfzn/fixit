import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

abstract class ChatRepository {
  Stream<List<ChatList>> streamChatList(String uid);

  Future<Either<Failure, ChatList>> newChatList(String uid);

  Stream<List<Chat>> streamChat(String idChat);

  Future<Either<Failure, List<Chat>>> getChat(String idChat);

  Future<Either<Failure, Chat>> postChat(PostChatParams params);

  Future<Either<Failure, ChatList>> readChat(ChatList params);
}
