import 'package:dartz/dartz.dart';
import 'package:fixit/core/error/failure.dart';
import 'package:fixit/features/features.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDatasource _datasource;

  ChatRepositoryImpl(this._datasource);

  @override
  Stream<List<Chat>> streamChat(String idChat) async* {
    try {
      yield* _datasource.streamChat(idChat).map(
            (event) => event
                .map(
                  (e) => e.toEntity(),
                )
                .toList(),
          );
    } catch (e) {
      yield* Stream.error(e);
    }
  }

  @override
  Stream<List<ChatList>> streamChatList(String uid) async* {
    try {
      yield* _datasource.streamChatList(uid).map(
            (event) => event
                .map(
                  (e) => e.toEntity(),
                )
                .toList(),
          );
    } catch (e) {
      yield* Stream.error(e);
    }
  }

  @override
  Future<Either<Failure, List<Chat>>> getChat(String idChat) async {
    final response = await _datasource.getChat(idChat);

    return response.fold(
      (l) => left(l),
      (r) {
        final listChat = r.map((e) => e.toEntity()).toList();
        return right(listChat);
      },
    );
  }

  @override
  Future<Either<Failure, Chat>> postChat(PostChatParams params) async {
    final response = await _datasource.postChat(params);

    return response.fold(
      (l) => left(l),
      (r) => right(r.toEntity()),
    );
  }

  @override
  Future<Either<Failure, ChatList>> newChatList(String uid) async {
    final response = await _datasource.newChatList(uid);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }

  @override
  Future<Either<Failure, ChatList>> readChat(ChatList params) async {
    final response = await _datasource.readChat(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }
}
