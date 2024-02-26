import 'package:fixit/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_list.freezed.dart';

@freezed
class ChatList with _$ChatList {
  factory ChatList({
    String? id,
    String? clientUid,
    int? clientUnread,
    String? technicianUid,
    int? technicianUnread,
    String? lastSender,
    String? lastMessage,
    DateTime? lastTime,
    List<Chat>? chats,
  }) = _ChatList;

  ChatList._();

  ChatList toModel() => ChatList(
        id: id,
        clientUid: clientUid,
        clientUnread: clientUnread,
        technicianUid: technicianUid,
        technicianUnread: technicianUnread,
        lastSender: lastSender,
        lastMessage: lastMessage,
        lastTime: lastTime,
      );
}
