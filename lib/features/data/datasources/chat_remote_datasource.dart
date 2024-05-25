import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

abstract class ChatRemoteDatasource {
  Stream<List<ChatListModel>> streamChatList(String uid);

  Stream<List<ChatModel>> streamChat(String idChat);

  Future<Either<Failure, List<ChatModel>>> getChat(String idChat);

  Future<Either<Failure, ChatModel>> postChat(PostChatParams params);

  Future<Either<Failure, ChatListModel>> newChatList(String params);

  Future<Either<Failure, ChatListModel>> readChat(ChatList params);
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
          .orderBy('lastTime', descending: true)
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

      await _collRef
          .doc(chatList.id)
          .collection('chats')
          .doc(postChat.id)
          .update({'id': postChat.id});

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

  @override
  Future<Either<Failure, ChatListModel>> newChatList(String params) async {
    try {
      final clientUid = FirebaseAuth.instance.currentUser?.uid;
      final response = await _collRef.add(
        ChatListModel(clientUid: clientUid, technicianUid: params).toJson(),
      );

      final chatList = ChatListModel(
        id: response.id,
        clientUid: clientUid,
        technicianUid: params,
        clientUnread: 0,
        technicianUnread: 0,
        lastTime: DateTime.now(),
      );

      await _collRef.doc(response.id).update(chatList.toJson());

      return Right(chatList);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChatListModel>> readChat(ChatList params) async {
    try {
      for (int i = 0; i < params.chats!.length; i++) {
        if (params.chats![i].isRead == false &&
            params.chats![i].recipient == params.clientUid) {
          await _collRef
              .doc(params.id)
              .collection('chats')
              .doc(params.chats![i].id)
              .update({'isRead': true});
        }
      }

      await _collRef.doc(params.id).update({'clientUnread': 0});

      final response = params.copyWith(clientUnread: 0).toModel();

      return right(response);
    } catch (e) {
      return left(FirestoreFailure(e.toString()));
    }
  }
}
