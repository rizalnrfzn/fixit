// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewModelImpl _$$ReviewModelImplFromJson(Map<String, dynamic> json) =>
    _$ReviewModelImpl(
      clientUid: json['clientUid'] as String?,
      review: json['review'] as String?,
      rating: json['rating'] as int?,
      dateTime: _$JsonConverterFromJson<String, DateTime>(
          json['dateTime'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$ReviewModelImplToJson(_$ReviewModelImpl instance) =>
    <String, dynamic>{
      'clientUid': instance.clientUid,
      'review': instance.review,
      'rating': instance.rating,
      'dateTime': _$JsonConverterToJson<String, DateTime>(
          instance.dateTime, const DateTimeConverter().toJson),
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
