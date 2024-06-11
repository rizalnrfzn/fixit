// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepairOrderModelImpl _$$RepairOrderModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RepairOrderModelImpl(
      id: json['id'] as String?,
      clientUid: json['clientUid'] as String?,
      technicianUid: json['technicianUid'] as String?,
      clientLocation: _$JsonConverterFromJson<GeoPoint, LatLng>(
          json['clientLocation'], const LatLngConverter().fromJson),
      technicianLocation: _$JsonConverterFromJson<GeoPoint, LatLng>(
          json['technicianLocation'], const LatLngConverter().fromJson),
      clientAddress: json['clientAddress'] as String?,
      duration: (json['duration'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      electronicId: json['electronicId'] as String?,
      gripe:
          (json['gripe'] as List<dynamic>?)?.map((e) => e as String).toList(),
      damage:
          (json['damage'] as List<dynamic>?)?.map((e) => e as String).toList(),
      electronicPicture: (json['electronicPicture'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      checkingCost: json['checkingCost'] as int?,
      repairCost: json['repairCost'] as int?,
      totalCost: json['totalCost'] as int?,
      dateTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['dateTime'], const TimestampConverter().fromJson),
      status: json['status'] as String?,
      repair: json['repair'] as bool?,
      pay: json['pay'] as bool?,
      cancelled: json['cancelled'] as bool?,
      reasonCancelled: json['reasonCancelled'] as String?,
    );

Map<String, dynamic> _$$RepairOrderModelImplToJson(
        _$RepairOrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientUid': instance.clientUid,
      'technicianUid': instance.technicianUid,
      'clientLocation': _$JsonConverterToJson<GeoPoint, LatLng>(
          instance.clientLocation, const LatLngConverter().toJson),
      'technicianLocation': _$JsonConverterToJson<GeoPoint, LatLng>(
          instance.technicianLocation, const LatLngConverter().toJson),
      'clientAddress': instance.clientAddress,
      'duration': instance.duration,
      'distance': instance.distance,
      'electronicId': instance.electronicId,
      'gripe': instance.gripe,
      'damage': instance.damage,
      'electronicPicture': instance.electronicPicture,
      'checkingCost': instance.checkingCost,
      'repairCost': instance.repairCost,
      'totalCost': instance.totalCost,
      'dateTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.dateTime, const TimestampConverter().toJson),
      'status': instance.status,
      'repair': instance.repair,
      'pay': instance.pay,
      'cancelled': instance.cancelled,
      'reasonCancelled': instance.reasonCancelled,
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
