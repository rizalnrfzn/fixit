import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

abstract class ChatRemoteDatasource {
  Stream<List<ChatListModel>> streamChatList(String uid);

  Stream<List<ChatModel>> streamChat(String idChat);

  Future<Either<Failure, List<ChatModel>>> getChat(String idChat);

  Future<Either<Failure, ChatModel>> postChat(PostChatParams params);
}

class ChatRemoteDatasourceImpl implements ChatRemoteDatasource {
  final _collRef = FirebaseFirestore.instance.collection('chat');

  @override
  Stream<List<ChatModel>> streamChat(String idChat) async* {
    try {
      yield* _collRef
          .doc(idChat)
          .collection('chats')
          .orderBy('timestamp', descending: false)
          .snapshots()
          .map(
            (event) => event.docs
                .map(
                  (e) => ChatModel.fromJson(e.data()).copyWith(id: e.id),
                )
                .toList(),
          );
    } catch (e) {
      yield* Stream.error(e);
    }
  }

  @override
  Stream<List<ChatListModel>> streamChatList(String uid) async* {
    try {
      yield* _collRef
          .where('clientUid', isEqualTo: uid)
          .orderBy('lastTime', descending: false)
          .snapshots()
          .map(
            (event) => event.docs
                .map(
                  (e) => ChatListModel.fromJson(e.data()).copyWith(id: e.id),
                )
                .toList(),
          );
    } catch (e) {
      yield* Stream.error(e);
    }
  }

  @override
  Future<Either<Failure, List<ChatModel>>> getChat(String idChat) async {
    try {
      final response = await _collRef
          .doc(idChat)
          .collection('chats')
          .orderBy('timestamp', descending: false)
          .get();

      final listChat = response.docs.map((e) {
        return ChatModel.fromJson(e.data()).copyWith(id: e.id);
      }).toList();

      return right(listChat);
    } catch (e) {
      return left(FirestoreFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChatModel>> postChat(PostChatParams params) async {
    try {
      final chat = params.chat.toModel();
      final chatList = params.chatList.toModel();

      final Map<String, dynamic> chatListUpdate = {
        'technicianUnread': chatList.technicianUnread! + 1,
        'lastMessage': chat.message,
        'lastSender': chatList.clientUid,
        'lastTime': Timestamp.fromDate(chat.timestamp!),
      };

      final postChat = await _collRef
          .doc(chatList.id)
          .collection('chats')
          .add(chat.toJson());

      await _collRef.doc(chatList.id).update(chatListUpdate);

      final newChat = await _collRef
          .doc(chatList.id)
          .collection('chats')
          .doc(postChat.id)
          .get();

      return right(ChatModel.fromJson(newChat.data()!));
    } on FirebaseException catch (e) {
      return left(FirestoreFailure(e.code));
    } catch (e) {
      return left(FirestoreFailure(e.toString()));
    }
  }
}
