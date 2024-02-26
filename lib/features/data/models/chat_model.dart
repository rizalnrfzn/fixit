import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  factory ChatModel({
    String? id,
    String? message,
    String? sender,
    String? recipient,
    bool? isRead,
    @TimestampConverter() DateTime? timestamp,
  }) = _ChatModel;

  ChatModel._();

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  factory ChatModel.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? options) =>
      ChatModel.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, dynamic> toFirestore(
          ChatModel object, SetOptions? options) =>
      object.toJson();

  Chat toEntity() => Chat(
        id: id,
        message: message,
        sender: sender,
        recipient: recipient,
        isRead: isRead,
        timestamp: timestamp,
      );
}
