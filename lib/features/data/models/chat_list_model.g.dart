// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatListModelImpl _$$ChatListModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatListModelImpl(
      id: json['id'] as String?,
      clientUid: json['clientUid'] as String?,
      clientUnread: json['clientUnread'] as int?,
      technicianUid: json['technicianUid'] as String?,
      technicianUnread: json['technicianUnread'] as int?,
      lastSender: json['lastSender'] as String?,
      lastMessage: json['lastMessage'] as String?,
      lastTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['lastTime'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$ChatListModelImplToJson(_$ChatListModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientUid': instance.clientUid,
      'clientUnread': instance.clientUnread,
      'technicianUid': instance.technicianUid,
      'technicianUnread': instance.technicianUnread,
      'lastSender': instance.lastSender,
      'lastMessage': instance.lastMessage,
      'lastTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.lastTime, const TimestampConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
