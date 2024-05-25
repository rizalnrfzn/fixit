import 'package:fixit/features/data/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';

@freezed
class Chat with _$Chat {
  factory Chat({
    String? id,
    String? message,
    String? sender,
    String? recipient,
    bool? isRead,
    DateTime? timestamp,
  }) = _Chat;

  Chat._();

  ChatModel toModel() => ChatModel(
        id: id,
        message: message,
        sender: sender,
        recipient: recipient,
        isRead: isRead,
        timestamp: timestamp,
      );
}
