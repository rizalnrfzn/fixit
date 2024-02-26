import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit/features/domain/domain.dart';
import 'package:fixit/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_list_model.freezed.dart';
part 'chat_list_model.g.dart';

@freezed
class ChatListModel with _$ChatListModel {
  factory ChatListModel({
    String? id,
    String? clientUid,
    int? clientUnread,
    String? technicianUid,
    int? technicianUnread,
    String? lastSender,
    String? lastMessage,
    @TimestampConverter() DateTime? lastTime,
  }) = _ChatListModel;

  ChatListModel._();

  factory ChatListModel.fromJson(Map<String, dynamic> json) =>
      _$ChatListModelFromJson(json);

  factory ChatListModel.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? options) =>
      ChatListModel.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, dynamic> toFirestore(
          ChatListModel object, SetOptions? options) =>
      object.toJson();

  ChatList toEntity() => ChatList(
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
