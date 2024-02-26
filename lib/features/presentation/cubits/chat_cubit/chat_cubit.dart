import 'dart:async';

import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
    this._streamChatList,
    this._getChat,
    this._postChat,
  ) : super(const _Loading());

  final StreamChatListUsecase _streamChatList;
  final GetChatUsecase _getChat;
  final PostChatUsecase _postChat;

  StreamSubscription? _chatListSubscription;
  StreamSubscription? _chatSubscription;

  List<ChatList> chatList = [];

  void streamChatList(String uid) {
    chatList = [];
    _chatListSubscription?.cancel();
    _chatListSubscription = _streamChatList.call(uid).listen((event) async {
      chatList = [];
      for (var list in event) {
        final chats = await getChat(list.id!);
        chatList.add(list.copyWith(chats: chats));
      }
      print(chatList);
      emit(_Success(chatList));
    });
  }

  Future<List<Chat>> getChat(String idChat) async {
    final response = await _getChat.call(idChat);

    return response.fold((l) {
      if (l is FirestoreFailure) {
        emit(_Failure(l.code));
      }
      return [];
    }, (r) {
      return r;
    });
  }

  Future<void> sendChat(PostChatParams params) async {
    final response = await _postChat.call(params);

    response.fold((l) {
      if (l is FirestoreFailure) {
        emit(_Failure(l.code));
      }
    }, (r) {
      emit(_Success(chatList));
    });
  }

  @override
  Future<void> close() {
    _chatListSubscription?.cancel();
    _chatSubscription?.cancel();
    return super.close();
  }
}
