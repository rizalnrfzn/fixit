// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_direction_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectionParamsImpl _$$DirectionParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$DirectionParamsImpl(
      json['location'] == null
          ? null
          : LatLng.fromJson(json['location'] as Map<String, dynamic>),
      json['destinationLocation'] == null
          ? null
          : LatLng.fromJson(
              json['destinationLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DirectionParamsImplToJson(
        _$DirectionParamsImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'destinationLocation': instance.destinationLocation,
    };
